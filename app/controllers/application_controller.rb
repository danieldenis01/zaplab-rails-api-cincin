class ApplicationController < ActionController::API
  rescue_from ActiveRecord::DeleteRestrictionError, with: :delete_not_allowed

  def authenticate_user!
    head :unauthorized unless current_user
  end

  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    decoded_payload = JsonWebTokenService.decode(header)
    @current_user = User.find decoded_payload[:user_id]
  end

  protected

  def delete_not_allowed
    head :forbidden
  end
end
