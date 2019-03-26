class SamuraisController < ApplicationController
  before_action :set_clan
  before_action :set_clan_samurai, only: [:show, :update, :destroy]

  # GET /clans/:clan_id/samurais
  def index
    json_response(samurais)
  end

  # GET /clans/:clan_id/samurais/:id
  def show
    json_response(@samurai)
  end

  # POST /clans/:clan_id/samurais
  def create
    @clan.samurais.create!(samurai_params)
    json_response(@clan, :created)
  end

  # PUT /clans/:clan_id/samurais/:id
  def update
    @samurai.update(samurai_params)
  end

  # DELETE /clans/:clan_id/samurais/:id
  def destroy
    @samurai.destroy
  end

  def samurais
    return @clan.samurais unless params.has_key?(:alive)
    params[:alive] == true ?  @clan.samurais.alive : @clan.samurais.dead
  end

  private

  def samurai_params
    params.permit(:name, :death_date)
  end

  def set_clan
    @clan = Clan.find(params[:clan_id])
  end

  def set_clan_samurai
    @samurai = @clan.samurais.find_by!(id: params[:id]) if @clan
  end
end
