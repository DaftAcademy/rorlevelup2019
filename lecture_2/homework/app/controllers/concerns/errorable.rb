module Errorable
    extend ActiveSupport::Concern

    included do
        rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
    end

    def render_validation_error(exception)
        data = { errors: [] }
        data[:errors] << { title: exception.message, status: 422 }
        render json: data, status: :unprocessable_entity
    end

    def render_not_found_error(exception)
        data = { errors: [] }
        data[:errors] << { title: exception.message, status: 404 }
        render json: data, status: :not_found
    end
end
