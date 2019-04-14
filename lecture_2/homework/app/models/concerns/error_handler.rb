module ErrorHandler
 extend ActiveSupport::Concern
  
 included do
   rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
   rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
 end

  def render_record_not_found(exception)
    render json: { message: exception.message }, status: 404
  end

  def render_record_invalid(exception)
    render json: { message: exception.message }, status: 422
  end
end
