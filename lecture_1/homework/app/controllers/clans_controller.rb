class ClansController < ApplicationController
  def index
    render json: clans.to_json(only: %w[ id name])
  end

  def show
    render json: clan.to_json()
  end

  def create
    @clan = Clan.new(clan_params)
    if @clan.save
      render json: @clan.to_json(only: %w[ id name ]), status: 201
    else
      render json: { errors: @clan.errors }, status: 422
    end
  end

  def update
    begin
      clan.update!(clan_params)
      render json: clan.to_json(only: %w[ id name ]), status: 201
    rescue => exception
      render json: exception.to_json, status: 422
    end
  end

  def destroy
    clan.destroy!
    render json: "You have deleted #{clan[:name]} Clan".to_json, status: 200
  end

  private

  def clans
    @clans ||= Clan.all
  end

  def clan
    @clan ||= Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name)
  end
end
