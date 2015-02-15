class PaymentsController < ApplicationController

  def index
    payments = Payment.all #change to current user in production
    render json: payments
  end

  def show
    payment = Payment.find(params[:id])
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
