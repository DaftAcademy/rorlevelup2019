# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: MercenaryQuery.free_at_now(relation: Mercenary)
  end

  def show
    render json: mercenary
  end

  def employ_best
    mercenary = MercenaryQuery.not_hired_by_others(relation: Mercenary)
    mercenary = MercenaryQuery.free_at_now(relation: mercenary)
    mercenary = MercenaryQuery.best(relation: mercenary)

    return if mercenary.nil?

    prepare(mercenary)
    render json:  mercenary.warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless( mercenary.available_from < Time.now && mercenary.warrior == nil)

    prepare(mercenary)
    render json: mercenary.warrior, include: [:mercenary], status: 201
  end

  private

  def prepare(mercenary)
    MercenaryHelper.addToArmy(mercenary: mercenary, building: find_building, clan: find_clan)
    MercenaryHelper.setContract(mercenary: mercenary, contract_len: params[:contract_len])
    MercenaryHelper.create_good_weapon(mercenary: mercenary)
    mercenary.warrior.destroy! unless mercenary.save 
  end

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def find_building
    Building.find(params[:building_id]) if params[:building_id]
  end

  def find_clan
    Clan.find(params[:clan_id]) if params[:clan_id]
  end
end
