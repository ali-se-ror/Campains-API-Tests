class ApplicationController < ActionController::API
  before_action :authorize_request, except: [:login, :welcome]

  def not_found
    render json: { error: 'not_found' }
  end
  def welcome
    render json: { greetings: 'Welcome to ruby fun stuff... :P ' }
  end
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = Jwt.decode(header)
      @current_user = User.find(@decoded[:user_id])
      render json: { errors: 'You Need to login to continue' }, status: :unauthorized unless @current_user.online
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
