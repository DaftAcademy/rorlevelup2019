# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { message: exception.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: { message: exception.message }, status: :unprocessable_entity
    end
  end
end
