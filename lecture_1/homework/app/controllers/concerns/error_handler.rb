module ErrorHandler
  extend ActiveSupport::Concern
  # rozwiązanie znalezione w internecie, ale strasznie mi się spodobało z uwagi 
  # na przeniesienie obsługi błędow w inne miejsce zachowując przejrzysty kod w controlerach <3
  included do
    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |error|
      json_response({ message: error.message }, :unprocessable_entity)
    end
  end
end