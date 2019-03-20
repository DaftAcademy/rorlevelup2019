module Response
  DEFAULT_LIMIT = 20

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def limit
    @limit ||= params[:limit] || DEFAULT_LIMIT
  end
end