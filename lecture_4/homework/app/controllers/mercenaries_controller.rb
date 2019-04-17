# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: MercenaryQueries.available.all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_worst
    mercenary = MercenariesQuery.sort_available_price_ascending.first
    mercenary_employer.call(mercenary)
    render json: mercenary, include: [:warrior], status: 201
  end

  def employ_best
    mercenary = MercenariesQuery.sort_available_exp_descending.first
    mercenary_employer.call(mercenary)
    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    mercenary = MercenariesQuery.available.sample
    mercenary_employer.call(mercenary)
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary_params
    params.permit(:name, :expirience, :price, :clan_id, :building_id, :warrior_id)
  end

  def mercenary_employer
    MercenaryEmployer.new(mercenary_params)
  end

  def mercenary
    @mercenary ||= MercenaryQueries.find_by_id(params[:id])
  end
end
