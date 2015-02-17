class PaymentsController < SecuredController

  def index
    payments = Payment.where("house_id = #{params[:house_id]} and payer_id = #{params[:user_id]} or receiver_id = #{params[:user_id]}")
    render json: payments
  end

  def show
    render json: Payment.find(params[:id])
  end

end
