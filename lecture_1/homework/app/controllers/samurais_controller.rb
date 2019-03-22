class SamuraisController < ApplicationController
  before_action :clan
  
  def index
    if params.has_key?(:alive)
      samurais = clan.samurais.where(date_death: nil)
    elsif params.has_key?(:dead)
      samurais = clan.samurais.where.not(date_death: nil)
    else
      samurais = clan.samurais.all
    end
    render json: samurais.to_json(only: %w[id name armor num_battles date_death])
  end

  def create
    samurai = @clan.samurais.create!(samurai_params)
    render json: samurai.to_json(only: %w[id name armor num_battles date_death]), status: 201
  end

  def update
    samurai.update!(samurai_params)
    render json: samurai.to_json(only: %w[id name armor num_battles date_death]), status: 201
  end

  def destroy
    samurai.destroy!
    head 204
  end

  private

  def samurai
    @samurai ||= @clan.samurais.find(params[:samurai_id])
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armor, :date_death)
  end
end
