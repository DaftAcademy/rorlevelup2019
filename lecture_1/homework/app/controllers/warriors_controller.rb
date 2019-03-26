# frozen_string_literal: true

class WarriorsController < ApplicationController
  # GET /clans/:clan_id/warriors
  def index
    warriors = clan.warriors

    warriors = filter_warriors(warriors, params)

    warriors = warriors.first(params[:limit].to_i) if params[:limit].present?

    render json: warriors.to_json(only: %w[id name armor battles join_date death_date type])
  end

  # POST /clans/:clan_id/warriors
  def create
    warrior = clan.warriors.create!(warrior_params)
    render json: warrior.to_json(only: %w[id name armor battles join_date death_date type]), status: 201
  rescue ActiveRecord::RecordInvalid => exception
    render json: exception.to_json(only: %w[error]), status: 422
  rescue ActiveRecord::SubclassNotFound => exception
    render json: exception.to_json(only: %w[error]), status: 422
  end

  # PUT /clans/:clan_id/warriors/:id
  def update
    warrior.update!(samurai_params)
    render json: warrior.to_json(only: %w[id name armor battles join_date death_date type])
  rescue ActiveRecord::RecordInvalid => exception
    render json: exception.to_json(only: %w[error]), status: 422
  end

  # DELETE /clans/:clan_id/warriors/:id
  def destroy
    warrior.destroy!
    head 204
  end

  private

  def clan
    Clan.find(params[:clan_id])
  end

  def warrior
    @warrior ||= clan.warriors.find(params[:id])
  end

  def warrior_params
    params.permit(:name, :armor, :battles, :join_date, :death_date, :type)
  end

  def filter_warriors(warriors, params)
    warriors = filter_alive(warriors, params[:alive]) if params[:alive].present?
    warriors
  end

  def filter_alive(warriors, is_alive)
    warriors = warriors.where(death_date: nil) if is_alive == 'true'
    warriors = warriors.where.not(death_date: nil) if is_alive == 'false'
    warriors
  end
end
