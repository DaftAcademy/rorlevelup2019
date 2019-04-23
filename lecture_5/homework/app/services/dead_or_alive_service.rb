class DeadOrAliveService
  def initialize(warriors, params_key)
    @warriors = warriors
    @params_key = params_key
  end

  def call
    @params_key.to_i == 0 ? @warriors.dead : @warriors.alive
  end
end
