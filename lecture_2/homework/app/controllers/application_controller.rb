class ApplicationController < ActionController::API

 # Add handle errors
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_err
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def render_not_found_err(exception)
    render json: exception, status: 404
  end

  def render_invalid(exception)
    render json: { message: exception.record.errors }, status: 422
  end


end
