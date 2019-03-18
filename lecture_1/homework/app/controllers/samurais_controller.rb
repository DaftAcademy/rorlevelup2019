class SamuraisController < ApplicationController
  def show
      render json: samurai.to_json(
        only: %w[id name cuirass_quality battles_count joined_date])
  end

  def index
    if params[:dead].present?
      params[:dead].to_i == 1 ?
        samurais = clan.samurais.dead : samurais = clan.samurais.alive
    else
      samurais = clan.samurais
    end

    render json: samurais.to_json(
      only: %w[id name cuirass_quality battles_count joined_date])
  end

  def create
    samurai = clan.samurais.create!(samurai_params)

    render json: samurai.to_json(
      only: %w[id name cuirass_quality battles_count joined_date]), status: 201
  end

  def update
    samurai.update!(samurai_params)

    render json: samurai.to_json(
      only: %w[id name cuirass_quality battles_count joined_date])
  end

  def destroy
    samurai.destroy!

    head 204
  end

  private

  def samurai
    @samurai ||= clan.samurais.find(params[:id])
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :cuirass_quality, :battles_count, :joined_date, :dead)
  end

end
