module VenmoHelper
  extend self
  include HTTParty

  def venmo_auth_code
    @current_user = User.find_by(google_id: params[:state])
    return params[:code] if params[:code]
  end

  def venmo_authorize
    url = "https://api.venmo.com/v1/oauth/access_token"
    @venmo_response = HTTParty.post(url, :query => {
      client_id: ENV['VENMO_CLIENT_ID'],
      client_secret: ENV['VENMO_SECRET'],
      code: venmo_auth_code })
    capture_venmo_access_token
  end

  def capture_venmo_access_token
    response = JSON.parse(@venmo_response.to_json)
    debugger
    @current_user.update(venmo_token: response["access_token"]) if response["access_token"]
  end

  def create_venmo_payment
    url = "https://sandbox-api.venmo.com/v1/payments"
    @venmo_payment_response =
      HTTParty.post(url, :query => payment_params)
    capture_payment_response
  end

  def capture_payment_response
    response = JSON.parse(@venmo_payment_response.to_json)["data"]
    @payment = Payment.new(user_id: @current_user.id,
                   payment_to: response["payment"]["target"]["user"]["id"],
                   amount: response["payment"]["amount"].to_f,
                   note: response["payment"]["note"],
                   venmo_payment_id: response["payment"]["id"],
                   venmo_payment_status: response["payment"]["status"]
                   )
  end

  def payment_successful?
    true if @payment.save && @payment.venmo_payment_status == "settled"
    # @payment.save && @payment.venmo_payment_status == "settled"

  end

  def payment_params
    {email: params[:receivers_email],
     note: params[:payment_note],
     amount: params[:payment_amount].to_f,
     access_token: @current_user.venmo_access_token}
  end

end
