def WarriorFinder

  def initialize(params)
    @params = params
  end

  def run
    return Warrior.find(@params[:warrior_id]) if @params[:warrior_id]
    Warrior.first
  end

end
