# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?
  end

  def register_success
    render json: {
      message: 'Регистрация прошла успешно!',
      user: current_user
    }, status: :ok
  end

  # def register_failed
  #   render json: {
  #     message: { message: 'Что-то пошло не так:(' },
  #     status: :unprocessable_entity
  #   }
  # end
end
