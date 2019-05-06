module Errorable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
  end

  def render_validation_error(exception)
  	render json: exception.record.errors, status: 422
  end

  def render_not_found_error(exception)
  	render json: { errors: exception.message }, status: 404
  end
end

class ApplicationController
  include Errorable
end