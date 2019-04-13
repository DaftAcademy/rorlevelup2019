# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: MercenariesQuery.currently_available
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = most_experienced
    warrior = MercenaryEmployer.new(
      mercenary: mercenary,
      params: mercenary_params
    ).call
    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now

    warrior = MercenaryEmployer.new(
      mercenary: mercenary,
      params: mercenary_params
    ).call
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary = Mercenary.find(params[:id]) || NullMercenary.new
  end

  def mercenary_params
    params.permit(:building_id, :clan_id)
  end

  def most_experienced
    MercenariesQuery.currently_available.order(experience: :desc).first
  end
end
