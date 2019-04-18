# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: Mercenary.available
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = Mercenary.available.price_asc.exp_desc.first
    WarriorRecruiter.new(mercenary: mercenary,
                         params: mercenary_params).call

    render json: mercenary, include: [:warrior], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    WarriorRecruiter.new(mercenary: mercenary,
                         params: mercenary_params).call

    render json: mercenary, include: [:warrior], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find_by(id: params[:id])
  end

  def mercenary_params
    params.permit(:building_id, :clan_id, :type)
  end
end
