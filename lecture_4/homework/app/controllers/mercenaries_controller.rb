# frozen_string_literal: true

class MercenariesController < ApplicationController
  def index
    render json: Mercenary.where(available: true).all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    mercenary = MercenariesQuery.best_mercenary
    warrior = WarriorCreator.new(params, mercenary).call

    render json: warrior, include: %i[mercenary building weapon], status: 201
  end

  def employ
    return unless mercenary.available

    warrior = WarriorCreator.new(params, mercenary).call
    render json: warrior, include: %i[mercenary building weapon], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find_by(id: params[:id])
  end
end
