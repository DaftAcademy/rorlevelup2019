# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: Mercenary.where('available_from < ?', Time.now).all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    warrior= merc_employer.employ_best
    render json: warrior, include: [:mercenary]
  end

  def employ
    return unless mercenary.available_from < Time.now
    warrior = merc_employer.employ(mercenary)
    render json: warrior, include: [:mercenary]
  end

  private

  def merc_employer
    ServiceObjects::MercenaryEmployer.new(params)
  end

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

end
