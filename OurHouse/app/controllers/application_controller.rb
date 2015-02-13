

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::StrongParameters

  before_action :authenticate_user!

  # Controller filters/helpers
  # user_signed_in?
  # current_user
  # user_session
end
