# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    mercenaries = params[:alive] ? Mercenary.alive : Mercenary.all
    mercenaries = MercenariesQuery.unavailable(relation: mercenaries) if params.has_key?(:unavailable)
    mercenaries = MercenariesQuery.available(relation: mercenaries) if params.has_key?(:available)
    return render json: { "error": "There are no mercenaries available right now" } if mercenaries.blank?
    render json: mercenaries
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def create
    warrior = WarriorCreator.new(
      id: params[:id],
      clan_id: params[:clan_id],
      building_id: params[:building_id]
    ).call
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end
end
