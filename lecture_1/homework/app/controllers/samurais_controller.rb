class SamuraisController < ApplicationController
  def index
    samurais = clan.samurais.all
    render json: samurai.to_json(only: %i[id name armour_rating battle_count join_date death_date])
  end
  def alive
    samurais = clan.samurais.where('death_date = ?', 'null' )
    render json: samurais.to_json(only: %i[id name armour_rating battle_count join_date])
  end
  def dead
    samurais = clan.samurais.where.not('death_date = ?', 'null' )
    render json: samurais.to_json(only: %i[id name armour_rating battle_count join_date death_date])
  end
  def show
    render json: samurai.to_json(only: %i[id name armour_rating battle_count join_date death_date])
  end
  def destroy
    samurai.destroy!
    head 204
    rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 404
  end
  def create
	samurai = clan.samurais.create!(samurai_params)
	render json: samurai.to_json(only: %i[id name armour_rating battle_count join_date death_date]), status: 201
    rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 422
  end
  def update
	samurai.update!(samurai_params)
	render json: samurai.to_json(only: %i[id name armour_rating battle_count join_date death_date]), status: 201
	rescue ActiveRecord::ActiveRecordError => e
	  render json: e.to_json, status: 422
  end
    private

  def samurai
    clan.samurais.find(params[:id])
  end

  def clan
    Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armour_rating, :battle_count, :join_date, :death_date)
  end
end