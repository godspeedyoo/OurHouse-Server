module VenmoHelper
  extend self
  require 'httparty'

  def venmo_auth_code
    @current_user = User.find(params[:state])
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
    @current_user.update(venmo_token: response["access_token"]) if response["access_token"]
  end

  def create_venmo_payment
    @venmo_payment_response = HTTParty.post("https://api.venmo.com/v1/payments", :query => payment_params)
    capture_payment_response
  end

  def capture_payment_response
    response = JSON.parse(@venmo_payment_response.to_json)["data"]
    status = true if response["payment"]["status"] == "settled" || response["payment"]["status"] == "pending"
    @payment = Payment.new(payer_id: current_user.id,
                   receiver_id: User.find_by(email: response["payment"]["target"]["email"]).id,
                   amount: response["payment"]["amount"].to_f,
                   description: response["payment"]["note"],
                   house_id: current_user.house_id,
                   fulfilled: status
                   )
  end

  def payment_successful?
    true if (@payment.save && @payment.fulfilled == true)
  end

  def payment_params
    {email: params[:receiver_email],
     note: params[:note],
     amount: params[:amount].to_f,
     access_token: current_user.venmo_token}
  end

end
