class AuthenticationController < ApplicationController

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = Jwt.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      @user.update(online: true)
      render json: { token: token, online: @user.online,
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def logout
    if @current_user.update(online: false)
      render json: { message: 'Logout Successfully'}, status: :ok
    else
      render json: { error: @current_user.errors }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
