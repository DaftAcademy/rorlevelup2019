class SamuraisController < ApplicationController

  def index
    query_params = request.query_string
    samurais = Clan.find(params[:clan_id]).samurai
    if query_params == 'alive'
      alive_samurais = samurais.where(death_date: nil)
      render json: alive_samurais.to_json(only: samurai_attr)
    elsif query_params == 'death'
      death_samurais = samurais.where.not(death_date: nil)
      render json: death_samurais.to_json(only: samurai_attr)
    elsif query_params == ''
      render json: samurais.to_json(only: samurai_attr)
    else
      render json: {message: 'Wrong query parameter, you should use alive (when you ask about alive samurais) or death (when you ask about dead samurais)'}, status: 400
    end
  end

  def show
    samurai = Samurai.find(params[:id])
    render json: samurai.to_json(only: samurai_attr)
  end

  def create
    samurai = Samurai.create!(samurai_params)
    render json: samurai.to_json(only: samurai_attr), status: 201
  end

  def update
    samurai = Samurai.find(params[:id])
    samurai.update!(samurai_params)
    render json: samurai.to_json(only: samurai_attr)
  end

  def destroy
    Samurai.destroy(params[:id])
    head 204
  end

  private

  def samurai_params
    params.permit(:name, :armor_class, :battle_no, :join_date, :death_date, :clan_id)
  end

  def samurai_attr
    %w[id name armor_class battle_no join_date death_date clan_id]
  end

end
