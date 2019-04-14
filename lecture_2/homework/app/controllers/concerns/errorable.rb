module Errorable
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  def record_invalid(exception)
    render json: exception.record.errors, status: 422
  end

  def record_not_found(exception)
    render json: exception.record.errors, status: 404
  end
    
end
