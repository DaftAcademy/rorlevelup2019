class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

  def render_validation_error(exception)
    render json: exception.record.errors, status: 422
  end

  def render_not_found_error(exception)
    render json: { error: exception.message }, status: 404
  end
end
