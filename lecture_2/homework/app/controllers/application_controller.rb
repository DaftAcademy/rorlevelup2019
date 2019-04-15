# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Errorable
  before_action :set_raven_context

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id])
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
  #  rescue_from ActiveRecord::RecordNotFound do |exception|
  #    render json: { message: exception.message }, status: 404
  #  end

  #  rescue_from ActiveRecord::RecordInvalid do |exception|
  #    render json: { message: exception.message }, status: 422
  #  end
end
