class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def render_not_found_response(exception)
    render json: { message: exception.message }, status: 404
  end

  def render_unprocessable_entity_response(exception)
    render json: { message: exception.message, errors: exception.record.errors }, status: 422
  end
end
