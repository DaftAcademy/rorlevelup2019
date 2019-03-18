class ApplicationController < ActionController::API
  require_relative '../../lib/errors/error_handler'
  include ErrorHandler
end
