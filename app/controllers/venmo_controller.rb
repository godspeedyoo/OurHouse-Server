class VenmoController < ApplicationController
  include VenmoHelper

  def index
    venmo_authorize
    if @current_user.venmo_token
      render :inline => %q[<body style="background-color: #6aa; font-family: 'Lato', sans-serif;"><div class="wrapper" style="color: #fff; left: 8%; position: absolute; text-align: center; top: 25%;"><h1 style="font-weight: 100;">Woohoo!<br>You've Successfully Linked your Venmo Account</h1></div>]
    else
      render json: { message: "fucked up"}
    end
  end

  def create
    create_venmo_payment
    if payment_successful?
      render json: { message: "venmo payment worked friend!"}
    else
      render json: { message: "Something went wrong...we've canceled this payment"}
    end
  end

end
