class V1::TokensController < ApplicationController
  def create
    user = User.find_by email: user_params[:email]

    if user&.authenticate(user_params[:password])
      render json: {
        token: JsonWebTokenService.encode(user_id: user.id),
        email: user.email
      }
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
