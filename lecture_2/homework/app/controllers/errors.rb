# frozen_string_literal: true
  module Errors
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_err
      rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
    end

    def render_not_found_err(exception)
      render json: exception, status: 404
    end

    def render_invalid(exception)
      render json: exception, status: 422
    end
  end
