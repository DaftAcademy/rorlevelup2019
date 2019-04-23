# frozen_string_literal: true

module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { message: exception.message }, status: 404
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: { message: exception.message }, status: 422
    end
  end
end
