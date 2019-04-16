# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: Queries::MercenariesQuery.available.all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ
    mercenary = Queries::MercenariesQuery.available.sample
    mercenary_employer.call(mercenary)
    render json: mercenary, include: [:warrior], status: 201
  end

  def employ_best
    mercenary = Queries::MercenariesQuery.sort_available_exp_descending.first
    mercenary_employer.call(mercenary)
    render json: mercenary, include: [:warrior], status: 201
  end

  def employ_cheapest
    mercenary = Queries::MercenariesQuery.sort_available_price_ascending.first
    mercenary_employer.call(mercenary)
    render json: mercenary, include: [:warrior], status: 201
  end

  private

  def mercenary_employer
    Services::MercenaryEmployer.new(mercenary_params)
  end

  def mercenary
    @mercenary ||= Queries::MercenariesQuery.find_by_id(params[:id])
  end

  def mercenary_params
    params.permit(:name, :experience, :available_from, :price, :clan_id, :building_id, :warrior_id)
  end
end
