class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: "Something went wrong!",
                   status: 422,
                   error: "Unprocessable entity",
                   exception: exception }, status: 422
  end
end
