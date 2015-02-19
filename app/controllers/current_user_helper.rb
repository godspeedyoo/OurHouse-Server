module CurrentUserHelper
  extend self

  def users_google_id
    authorization = request.headers['Authorization']
      raise InvalidTokenError if authorization.nil?

      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token,
        JWT.base64url_decode(Rails.application.secrets.auth0_client_secret))
      return decoded_token.first["sub"]
  end

  def current_user
      authorization = request.headers['Authorization']
      raise InvalidTokenError if authorization.nil?

      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token,
        JWT.base64url_decode(Rails.application.secrets.auth0_client_secret))

    @current_user ||= User.find_by(google_id: decoded_token.first["sub"])
  end

end
