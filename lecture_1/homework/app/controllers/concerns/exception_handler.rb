module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    # JSON response with message; Status code 422 - Unprocessable entity
    rescue_from ActiveRecord::RecordInvalid do |exception|
      json_response({message: exception.message}, :unprocessable_entity)
    end

    # JSON response with message; Status code 404 - Not found
    rescue_from ActiveRecord::RecordNotFound do |exception|
      json_response({message: exception.message}, :not_found)
    end
  end
end