module V1
  class UsersController < ApplicationController
    before_action :set_user, only: %i[update show]

    def create
      user = User.new(user_params_create)

      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update user_params_update
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @user.as_json(except: [:password_digest])
    end

    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find params[:id]
    end

    def user_params_create
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def user_params_update
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
end
