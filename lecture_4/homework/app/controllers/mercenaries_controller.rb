# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: mercenaries
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = MercenariesQuery.find_best
    render_no_available_mercenary and return unless mercenary

    recruit_mercenary(mercenary: mercenary)
  end

  def employ
    render_no_available_mercenary and return unless can_be_hired?

    recruit_mercenary(mercenary: mercenary)
  end

  private

  def mercenaries
    @mercenaries ||= MercenariesQuery.all_mercenaries
  end

  def mercenary
    @mercenary ||= MercenariesQuery.mercenary(mercenary_id: params[:id])
  end

  def recruit_mercenary(mercenary:)
    MercenaryRecruiter.call(mercenary: mercenary, params: params)
    render json: mercenary, include: %i[warrior], status: 201
  end

  def render_no_available_mercenary
    render json: { error: NoMercenary.new.employ }
  end

  def can_be_hired?
    MercenariesQuery.can_be_hired(mercenary_id: mercenary.id)
  end
end
