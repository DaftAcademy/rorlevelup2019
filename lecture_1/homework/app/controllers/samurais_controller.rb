class SamuraisController < ApplicationController

  def show
    render json: samurai.to_json(only: %i[id name armour joined_at deathtime])
  end

  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 100
    samurais = clan.samurais.first(limit)

    # Check if shogun want's to display only alive/dead samurais and if so filter them
    if params[:alive].to_s == "false"
      samurais.select! { |samurai| samurai.deathtime != nil } # TODO: Probably should also contain the check if it's a date
    elsif params[:alive].to_s == "true"
      samurais.select! { |samurai| samurai.deathtime == nil }
    end
    
    render json: samurais.to_json(only: %i[id name armour joined_at deathtime])
  end

  def create
    samurai = clan.samurais.create!(samurai_params)
    render json: samurai.to_json(only: %i[id name armour joined_at deathtime]), status: 201
  end

  def update
    samurai.update!(samurai_params)

    render json: samurai.to_json(only: %w[id name armour])
  end

  def destroy
    samurai.destroy!
    head 204 # Returns only the http header
  end

  private

  def samurai
    @samurai ||= clan.samurais.find(params[:id])
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armour, :joined_at, :deathtime) # I assume they might be already death ^^ ...
  end

end
