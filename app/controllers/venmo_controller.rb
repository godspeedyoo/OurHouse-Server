class VenmoController < ApplicationController
  include VenmoHelper

  def index
    venmo_authorize
    render json: { message: "hello from venmo index"}
  end

  def create
    create_venmo_payment
    if payment_successful?
      @payment = "It worked!"
    else
      @payment = "ya fucked up!"
    end
    render json: { message: "venmo payment worked asshole"}
  end

end
