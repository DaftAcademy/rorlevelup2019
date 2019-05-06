# frozen_string_literal: true

class DeadOrAliveService
  attr_reader :warriors, :params_key

  def initialize(warriors, params_key)
    @warriors = warriors
    @params_key = params_key
  end

  def call
    @params_key.to_i == 0 ? warriors.alive : warriors.dead
  end
end
