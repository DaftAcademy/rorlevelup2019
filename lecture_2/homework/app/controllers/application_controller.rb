class ApplicationController < ActionController::API
include Errorable
#  rescue_from ActiveRecord::RecordNotFound do |exception|
#    render json: { message: exception.message }, status: 404
#  end

#  rescue_from ActiveRecord::RecordInvalid do |exception|
#    render json: { message: exception.message }, status: 422
#  end
end
