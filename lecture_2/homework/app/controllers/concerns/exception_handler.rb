# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render_error(exception.message, 404)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render_error(exception.message, 422)
    end
  end

  def render_error(message, status)
    data = { errors: [] }
    data[:errors] << { message: message, status: status }
    render json: data, status: status
  end
end
