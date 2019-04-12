# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    # should i change it to available, since we cant use merc that were already taken?
    render json: QueryObjects::MercenaryQuery.not_busy.all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    free_merc = merc_employer.employ(QueryObjects::MercenaryQuery.available_by_exp.first)
    if free_merc
    merc_employer.employ(mercenary)
      render json: free_merc,include: [:warrior], status: 201
    end
  end

  def employ
    # noticed that there is no reason to manually check if warrior is available rather then
    if mercenary.free?
      warrior = merc_employer.employ(mercenary)
      render json: warrior, include: [:mercenary], status: 201
    else
      render json: 'he was busy', status: 404
    end
  end

  private

  def merc_employer
    ServiceObjects::MercenaryEmployer.new(params)
  end

  def mercenary
    @mercenary ||= QueryObjects::MercenaryQuery.find_by_id(params[:id])
  end
end
