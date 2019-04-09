# frozen_string_literal: true

module Exceptions
  class MyAppError < StandardError
    def initialize(message, context = {})
      super(message)
      @context = context
    end

    def raven_context
      @context
    end
  end

  class SpecificError < MyAppError
    def initialize(context = {})
      super('Message for SpecificError', context)
    end
  end
end
