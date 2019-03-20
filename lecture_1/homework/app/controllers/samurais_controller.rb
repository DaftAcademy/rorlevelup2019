class SamuraisController < ApplicationController
  # GET /clans/:clan_id/samurais
  def index
    if params.has_key?(:alive)
      if params[:alive] == 'true'
        json_response(clan.samurais.alive.to_json(only: samurai_attributes))
      elsif params[:alive] == 'false'
        json_response(clan.samurais.dead.to_json(only: samurai_attributes))
      else
        json_response('Validation failed: Alive param should have boolean value', 400)
      end
    else
      json_response(clan.samurais.to_json(only: samurai_attributes))
    end
  end

  # GET /clans/:clan_id/samurais/:id
  def show
    json_response(samurai.to_json(only: samurai_attributes))
  end

  # POST /clans/:clan_id/samurais
  def create
    samurai = clan.samurais.create!(samurai_params)
    json_response(samurai.to_json(only: samurai_attributes), :created)
  end

  # PUT /clans/:clan_id/samurais/:id
  def update
    samurai.update!(samurai_params)
    json_response(samurai.to_json(only: samurai_attributes))
  end

  # DELETE /clans/:clan_id/samurais/:id
  def destroy
    samurai.destroy!
    head :no_content #204
  end

  private

  def samurai_attributes
    %i[id name armor_quality battle_count joined_at died_at clan_id]
  end

  def samurai_params
    params.permit(:name, :armor_quality, :battle_count, :joined_at, :died_at)
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai
    @samurai ||= clan.samurais.find_by!(id: params[:id])
  end
end
