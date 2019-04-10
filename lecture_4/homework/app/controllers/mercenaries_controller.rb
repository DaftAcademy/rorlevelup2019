# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    #should i change it to available, since we cant use merc that were already taken?
    render json: QueryObjects::MercenaryQuery.not_busy().all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    warrior= merc_employer.employ_best
    render json: warrior, include: [:mercenary]
  end

  def employ
    #noticed that there is no reason to manually check if warrior is available rather then to user method from model
    return unless mercenary.free?
    warrior = merc_employer.employ(mercenary)
    render json: warrior, include: [:mercenary]
  end

  private

  def merc_employer
    ServiceObjects::MercenaryEmployer.new(params)
  end

  def mercenary
    @mercenary ||= QueryObjects::MercenaryQuery.find_by_id(params[:id])
  end

end
