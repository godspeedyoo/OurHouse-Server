class PaymentsController < SecuredController

  def index
  	# gets payments for the current user where they are the receiver or sender of the payment 
  	#     (i.e. don't let them see other housemates payments unless they are related to them)
    payments = Payment.where("house_id = #{current_user.house_id} and payer_id = #{current_user.id} or receiver_id = #{current_user.id}")
    render json: payments
  end

  def show
    render json: Payment.find(params[:id])
  end

end
