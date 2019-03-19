class SamuraisController < ApplicationController

  def show
    render json: samurai.to_json(only: %w[id name armor battles_count join_date death_date clan_id])
  end

  def index
    samurais = clan.samurais
    render json: samurais.to_json(only: %w[id name armor battles_count join_date death_date clan_id])
  end

  def create
    samurai = clan.samurais.create!(samurai_params)
    render json: samurai.to_json(only: %w[id name armor battles_count join_date death_date clan_id]), status: :created
  end

  def update
    samurai.update!(samurai_params)
    render json: samurai.to_json(only: %w[id name armor battles_count join_date death_date clan_id])
  end

  def destroy
    samurai.destroy!
    head 	:no_content
  end


  def alive
    samurais = clan.samurais.alive
    render json: samurais.to_json(only: %w[id name armor battles_count join_date death_date clan_id])
  end

  def dead
    samurais = clan.samurais.dead
    render json: samurais.to_json(only: %w[id name armor battles_count join_date death_date clan_id])
  end


  private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def samurai
      @samurai ||= clan.samurais.find(params[:id])
    end

    def samurai_params
      params.require(:samurai).permit(:name, :armor, :battles_count, :join_date, :death_date)
    end
end
