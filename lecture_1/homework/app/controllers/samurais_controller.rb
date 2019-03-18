class SamuraisController < ApplicationController

  def show
    render json: samurai.to_json()
  end

  def index
    limit = params.has_key?(:limit) ? params[:limit].to_i : 100
    samurais = clan.samurais.first(limit)

    # Check if shogun want's to display only alive/dead samurais and if so filter them
    if params[:alive].to_s == "false"
      samurais.select! { |samurai| samurai.died_at != nil } # TODO: Probably should also contain the check if it's a date
    elsif params[:alive].to_s == "true"
      samurais.select! { |samurai| samurai.died_at == nil }
    end
    
    render json: samurais.to_json(only: samurai_attributes), status: :ok
  end

  def create
    samurai = clan.samurais.new(samurai_params)

    # If samurai is being created inside the Clan his joined_at time wasn't provided let him join the clan now!
    if samurai.joined_at == nil && samurai.clan_id != nil
      samurai.joined_at = DateTime.now
    end

    if samurai.save
      render json: samurai.to_json(only: samurai_attributes), status: 201
    else
      render json: { errors: samurai.errors.messages }, status: 422
    end
  end

  def update

    if samurai.update(samurai.params)
      render json: samurai.to_json(only: samurai_attributes), status: :ok
    else
      render json: { errors: samurai.errors.messages }, status: 422
    end

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
    params.permit(:name, :armour, :battles_count, :joined_at, :died_at) # I assume they might be already death ^^ ...
  end

  def samurai_attributes
    %i[id name armour battles_count joined_at died_at]
  end

end
