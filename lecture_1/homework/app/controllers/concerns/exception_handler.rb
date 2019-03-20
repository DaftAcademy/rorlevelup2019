module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotFound, with: :forty_four
  end

  private

  # JSON response with message; Status code 404 - Not found
  def forty_four(e)
    json_response({message: e.message}, :not_found)
  end

  # JSON response with message; Status code 422 - Unprocessable entity
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end