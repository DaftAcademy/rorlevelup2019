# frozen_string_literal: true

class TowerController < ApplicationController\
  def index
    render json: Tower.all
  end

  def show
    render json: tower
  end

  def create
    tower = Tower.create(tower_params)
  end

  private

  def tower
    @tower ||= tower.find(params[:id])
  end

  def tower_params
    params.permit(:name)
  end
end
