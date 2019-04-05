# frozen_string_literal: true

module ErrorsHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |exception|
      render json: exception.record.errors, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: exception.message }, status: :not_found
    end
  end
end
