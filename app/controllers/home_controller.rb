# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: { message: 'Добро пожаловать в Meet me!' }
  end
end
