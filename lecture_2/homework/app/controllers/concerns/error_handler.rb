module ErrorHandler
  extend ActiveSupport::Concern
  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end

  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { message: exception.message }, status: 404
    raise ActionController::RoutingError.new('Not Found')
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: exception.message }, status: 422
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end