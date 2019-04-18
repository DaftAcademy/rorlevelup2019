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
    if check_mercenary
      render json: EmployService.new(params).run, include: [:mercenary], status: 201
    else
      render json: { message: 'There are no available mercenaries at the moment' }, status: 404
    end
  end

  def employ
    return unless mercenary.available_from < Time.now

    warrior = EmployService.new(params).run
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end

  def check_mercenary
    return true if Mercenary.where('available_from < ?', Time.now)
                            .where('warrior_id IS NULL').present?
  end
end
