# frozen_string_literal: true

class WarriorsController < ApplicationController
  def index
    warrior = if params.key?(:alive)
                clan.warriors.alive
              elsif params.key?(:dead)
                clan.warriors.dead
              else
                clan.warriors.all
              end
    render json: warrior
  end

  def show
    render json: warrior, include: %w[clan defensible weapon]
  end

  def create
    warrior = Clan.warriors.create!(wars_params)
    render json: warrior, include: 'clan'
  end

  def update
    warrior.update!(wars_params)
    render json: warrior, include: 'clan'
  end

  def destroy
    warrior.destroy!
    render head: 204
  end

  private

  def clan
    @clan ||= Clan.find(params[:clan_id])
  end

  def warrior
    clan ||= Clan.find(params[:clan_id])
    @warrior ||= clan.warriors.find(params[:id])
  end

  def wars_params
    params.permit(:clan_id, :name, :type, :defensible_id, :defensible_type, :armor_quality, :join_date, :death_date)
  end
end
