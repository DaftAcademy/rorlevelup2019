class SamuraisController < ApplicationController

  def index
    if params.has_key?(:alive)
      samurais = clan.samurais.alive
    elsif params.has_key?(:dead)
      samurais = clan.samurais.dead
    else
      samurais = clan.samurais
    end

    render json: samurais.to_json(only: %w[id name armor battles killed_date join_date clan_id])
  end

  def show
    render json: samurai.to_json(only: %w[id name armor battles killed_date join_date clan_id])
  end

  def create
    samurai = clan.samurais.create!(samurai_params)

    render json: samurai.to_json(only: %w[id name armor battles killed_date join_date clan_id]), status: 201
  end

  def update
    samurai.update!(samurai_params)
    render json: samurai.to_json(only: %w[id name armor battles killed_date join_date clan_id])
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
    params.permit(:name,:armor,:battles,:killed_date, :join_date)
  end
end
