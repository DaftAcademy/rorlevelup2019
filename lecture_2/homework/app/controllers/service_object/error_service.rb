# frozen_string_literal: true

module Service_Object
  module Error_Service
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_err
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def render_not_found_err(exception)
      render json: exception, status: 404
    end

    def render_invalid(exception)
      render json: exception, status: 422
    end
  end
end
