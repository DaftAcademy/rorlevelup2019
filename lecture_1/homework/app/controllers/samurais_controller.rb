# frozen_string_literal: true

class SamuraisController < ApplicationController
  def index
    samurais = clan.samurais.all
    if params.key?(:alive)
      if params[:alive].to_i.zero?
        render json: samurais.dead, include: %w[clan],
               status: 200
      else
        render json: samurais.alive, include: %w[clan],
               status: 200
      end
    else
      render json: samurais, include: %w[clan], status: 200
    end
  end

  def show
    render json: samurai.to_json, status: 200
  end

  def destroy
    samurai.destroy!
    head 204
  rescue ActiveRecord::ActiveRecordError => e
    render json: e.to_json, status: 404
  end

  def create
    samurai = clan.samurais.create!(samurai_params)
    render json: samurai.to_json, status: 201
  rescue ActiveRecord::ActiveRecordError => e
    render json: e.to_json, status: 422
  end

  def update
    samurai.update!(samurai_params)
    render json: samurai.to_json, status: 201
  rescue ActiveRecord::ActiveRecordError => e
    render json: e.to_json, status: 422
  end

  private

  def samurai
    @samurai ||= clan.samurais.find(params[:id])
  end

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def samurai_params
    params.permit(:name, :armour_rating, :battle_count, :join_date, :death_date)
  end
end
