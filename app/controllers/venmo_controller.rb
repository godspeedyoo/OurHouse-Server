class VenmoController < ApplicationController
  include VenmoHelper

  def index
    venmo_authorize
    if @current_user.venmo_token
      render json: { message: "close me"}
    else
      render json: { message: "fucked up"}
    end
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
