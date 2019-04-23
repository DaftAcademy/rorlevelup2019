# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: MercenariesQuery.new.available_from
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    available_mercenaries = MercenariesQuery.new.available_from
    mercenary = MercenariesQuery.new(available_mercenaries).first_in_order_of
    warrior = EmployService.new(params[:clan_id], params[:building_id], mercenary).call

    CreateGoodWeaponService.new(mercenary).call
    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    warrior = EmployService.new(params[:clan_id], params[:building_id]).call
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def mercenary_params
    params.permit(:clan_id, :building_id)
  end
end
