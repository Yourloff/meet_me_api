# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    return log_out_failure if current_user.nil?

    render json: {
      message: 'Вы вошли в систему',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: {
      message: 'Вы вышли из системы'
    }, status: :ok
  end

  def log_out_failure
    render json: {
      message: 'Authorization null'
    }, status: :unauthorized
  end
end
