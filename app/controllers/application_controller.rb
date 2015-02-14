require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :html

  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RespondWith
  include ActionController::MimeResponds
  include ActionController::ImplicitRender

  # helper: go through the tokens and find the user_id and match with the server
end
