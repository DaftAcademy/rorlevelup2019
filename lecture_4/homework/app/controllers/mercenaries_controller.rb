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
    mercenary = QueryObjects::MercenaryQuery.available_by_exp.first
    if mercenary
      merc_employer.call(mercenary)
      render json: mercenary, include: [:warrior], status: 201
    else
      raise ActiveRecord::RecordNotFound, 'no available mercenary was found'
    end
  end

  def employ
    # noticed that there is no reason to manually check if warrior is available rather then
    if mercenary.available?
      merc_employer.call(mercenary)
      render json: mercenary, include: [:warrior], status: 201
    else
      raise ActiveRecord::RecordInvalid, mercenary
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
