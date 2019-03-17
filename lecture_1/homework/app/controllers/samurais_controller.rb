class SamuraisController < ApplicationController
  def index
    if params.has_key?(:alive)
      render json: clan.samurais.where(death_date: "null")
    elsif params.has_key?(:dead)
      render json: clan.samurais.where.not(death_date: "null")
    else
      render json: clan.samurais.to_json(only: %w[ name armor battles id death_date]) 
    end
  end

  def show
    render json: samurai.to_json()
  end

  def create
    @samurai = Samurai.new(samurai_params)
    if @samurai.save
      render json: @samurai.to_json(only: %w[ name armor battles join_date death_date id ]), status: 201
    else
      render json: { errors: @samurai.errors }, status: 422
    end
  end

  def update
    begin
      samurai.update!(samurai_params)
      render json: samurai.to_json(only: %w[ name armor battles join_date death_date id ]), status: 201
    rescue => exception
      render json: exception.to_json, status: 422
    end
  end

  def destroy
    samurai.destroy!
    render json: "You have deleted #{samurai[:name]} Samurai".to_json, status: 200
  end

  private

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai
    @samurai ||= Samurai.find(params[:id])
  end

  def samurai_params
    params.permit(:name, :armor, :battles, :join_date, :death_date, :clan_id)
  end
end
