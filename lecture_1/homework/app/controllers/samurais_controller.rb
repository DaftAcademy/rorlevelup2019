class SamuraisController < ApplicationController
  before_action :set_clan
  before_action :set_clan_samurai, only: [:show, :update, :destroy]

  # GET /clans/:clan_id/samurais
  def index
    json_response(@clan.samurais)
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

  def dead
    json_response(@clan.samurais.where.not(death_date: [nil, ""]))
  end

  def alive
    json_response(@clan.samurais.where(death_date: [nil, ""]))
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
