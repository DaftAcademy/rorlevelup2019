# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: MercenaryQuery.available_from().all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  #TODO: Implement BestMercenaryFinder
  def employ_best
    mercenary = Mercenary.where('available_from < ?', Time.now).order(price: :asc).first # TODO: what about experience?
    clan = find_clan
    building = find_building
    warrior_class = clan.warriors.select('type, count(type) as warriors_count').group(:type).order('warriors_count ASC').first.class
    warrior = warrior_class.create!(name: mercenary.name, clan: clan, building: building, preferred_weapon_kind: mercenary.preferred_weapon_kind, mercenary: mercenary)
    create_good_weapon()
    render json: warrior, include: [:mercenary], status: 201
  end

  #TODO: Finish impementing MercenaryRecruiter
  def employ
    warrior = MercenaryRecruiter.new(params).run
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def find_building
    BuildingFinder.new(params).run
  end

  def find_clan
    ClanFinder.new(params).run
  end

end
