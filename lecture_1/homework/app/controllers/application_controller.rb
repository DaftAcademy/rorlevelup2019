# frozen_string_literal: true
class ApplicationController < ActionController::API

    include Errorable

    # Sentry configuration
    before_action :set_raven_context

    private
  
    # Sentry configuration
    def set_raven_context
      Raven.user_context(id: session[:current_user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end

end

