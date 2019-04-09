# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    mercenary = Mercenary.all
    mercenary = MercenaryQuery.available_now(relation: mercenary).all
    render json: mercenary
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  def employ_best
    warrior = HireMercenary.new(params: params, mercenary: MostExperiencedMercenaryFinder.new.run).call
    render json: warrior, include: [:mercenary], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now
    warrior = HireMercenary.new(params: params, mercenary: mercenary).call
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end
end
