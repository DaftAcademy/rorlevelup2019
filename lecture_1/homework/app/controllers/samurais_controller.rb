class SamuraisController < ApplicationController
  before_action :default_limit, only: %i[index all_samurais alive_samurais]

  def show
    render json: samurai.to_json(only: samurai_attributes)
  end

  def index
    samurais = if params[:alive] == 'true'
                  clan.samurais.where(death_at: 'null').first(params[:limit].to_i)
                elsif params[:alive] == 'false'
                  clan.samurais.where.not(death_at: 'null').first(params[:limit].to_i)
                else
                  clan.samurais.first(params[:limit].to_i)
                end
    render json: samurais.to_json(only: samurai_attributes)
  end

  def create
    samurai = clan.samurais.new(samurai_params)

    if samurai.save
      render json: samurai.to_json(only: samurai_attributes), status: 201
    else
      render json: { errors: samurai.errors.messages }, status: 422
    end
  end

  def update
    if samurai.update(samurai_params)
      render json: samurai.to_json(only: samurai_attributes)
    else
      render json: { errors: samurai.errors.messages }, status: 422
    end
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
    params.permit(samurai_attributes)
  end

  def samurai_attributes
    %w[id name armor battle_count join_at death_at clan_id]
  end

  def default_limit
    params[:limit] = 20 if params[:limit].to_i.zero?
  end

  def dead_or_alive
    params[:alive]
  end
end

