# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: mercenaries
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = MercenariesQuery.find_best

    render json: { error: NoMercenary.new.employ } and return unless mercenary

    MercenaryRecruiter.call(mercenary: mercenary, params: params)
    create_good_weapon(mercenary: mercenary)

    render json: mercenary, include: %i[warrior], status: 201
  end

  def employ
    unless MercenariesQuery.can_be_hired(mercenary_id: mercenary.id)
      render json: { error: NoMercenary.new.employ } and return
    end

    MercenaryRecruiter.call(mercenary: mercenary, params: params)
    create_good_weapon(mercenary: mercenary)

    render json: mercenary, include: %i[warrior], status: 201
  end

  private

  def mercenaries
    @mercenaries ||= MercenariesQuery.all_mercenaries
  end

  def mercenary
    @mercenary ||= MercenariesQuery.mercenary(mercenary_id: params[:id])
  end

  def create_good_weapon(mercenary:)
    case mercenary.preferred_weapon_kind.to_sym
    when :melee
      Weapons::Katana.create!(warrior: mercenary.warrior, range: 2, damage: 25)
    when :ranged
      Weapons::Musket.create!(warrior: mercenary.warrior, range: 40, damage: 10)
    else
      Weapons::MagicWand.create!(warrior: mercenary.warrior, range: 20, damage: 45)
    end
  end
end
