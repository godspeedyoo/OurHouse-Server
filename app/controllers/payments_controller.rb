class PaymentsController < ApplicationController

  def index
    payments = Payment.where(house_id: 1) #change '1' to current_user.house_id in production
    render json: payments
  end

  def show
    payment = Payment.find_by(id: params[:id], house_id: 1) ##change '1' to current_user.house_id in production
    render json: payment
  end

  def create
    payment = Payment.new(params[:payment])

    if payment.save
      render json: payment
    else
      render json: { payment: 'Payment not created' }, status: 403
    end
  end

end
