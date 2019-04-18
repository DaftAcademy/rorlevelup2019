# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    mercenaries = Mercenary.all
    if params.key?(:available)
      if params[:available].to_i.zero?
        render json: mercenaries.unavailable
      else
        render json: mercenaries.available
      end
    else
      render json: mercenaries
    end
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = MercenaryQuery.best
    if mercenary.present?
      warrior = MercenaryEmployer.new(mercenary_params, mercenary).call
      render json: warrior, include: [:mercenary], status: 201
    else
      render json: { message: 'Hiring a mercenary is impossible right now' }, status: 404
    end
  end

  def employ
    if mercenary.available_from > Time.now
      render json: { message: 'Mercenary is unavailable right now' }, status: 404
    else
      warrior = MercenaryEmployer.new(mercenary_params, mercenary).call
      render json: warrior, include: :mercenary, status: 201
    end
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def mercenary_params
    params.permit(:clan_id, :building_id, :warrior_class)
  end
end
