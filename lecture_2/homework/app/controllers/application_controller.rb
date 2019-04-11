# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_raven_context
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
 end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
 end

 private

 def set_raven_context
  Raven.user_context(id: session[:current_user_id]) # or anything else in session
  Raven.extra_context(params: params.to_unsafe_h, url: request.url)
end
end
