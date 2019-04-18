# frozen_string_literal: true

class ErrorsController < ApplicationController
  def index
    raise Exceptions::SpecificError.new(extra: { date: DateTime.now, another_important_key: 4 })
  end
end
