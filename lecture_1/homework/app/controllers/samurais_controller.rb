class SamuraisController < ApplicationController
  # GET /clans/:clan_id/samurais
  def index
    json_response(as_json(clan.samurais))
  end

  # GET /clans/:clan_id/samurais/:id
  def show
    json_response(as_json(samurai))
  end

  # POST /clans/:clan_id/samurais
  def create
    samurai = clan.samurais.create!(samurai_params)
    json_response(as_json(samurai), :created)
  end

  # PUT /clans/:clan_id/samurais/:id
  def update
    samurai.update!(samurai_params)
    json_response(as_json(samurai))
  end

  # DELETE /clans/:clan_id/samurais/:id
  def destroy
    samurai.destroy!
    head :no_content #204
  end

  private

  def as_json(samurai)
    samurai.to_json(only: %w[id name armor_quality battle_count joined_at died_at clan_id])
  end

  def samurai_params
    params.permit(:name, :armor_quality, :battle_count)
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai
    @samurai ||= clan.samurais.find_by!(id: params[:id])
  end
end
