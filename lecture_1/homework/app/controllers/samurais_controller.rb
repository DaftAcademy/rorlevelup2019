class SamuraisController < ApplicationController
  before_action :set_clan
  before_action :set_clan_samurai, only: [:show, :update, :destroy]

  def index
    if params[:live].present?
      if params[:live].to_i == 0
      json_response(@clan.samurais.dead)
      else 
      json_response(@clan.samurais.alive)
      end
    else  
      json_response(@clan.samurais)
    end
  end

  def show
    json_response(@samurai)
  end

  def create
    samurai = @clan.samurais.create!(samurai_params)
    json_response(samurai, :created)
  end

  def update
    @samurai.update(samurai_params)
    json_response(@samurai)
  end

  def destroy
    @samurai.destroy
    json_response(@samurai)
  end

  private

  def samurai_params
    params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
  end

  def set_clan
    @clan = Clan.find(params[:clan_id])
  end

  def set_clan_samurai
    @samurai = @clan.samurais.find_by!(id: params[:id]) if @clan
  end
end
