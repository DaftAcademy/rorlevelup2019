# frozen_string_literal: true

# This controller is written badly on purpose. Please refactor this
class MercenariesController < ApplicationController
  def index
    render json: Mercenary.where('available_from < ?', Time.now).all
  end

  def show
    render json: mercenary, include: [:warrior]
  end

  # Service Object for employ_best (Single Responsibility Principle)
  def employ_best
    mercenary = ChooseMercenaryService.new(params).run
    warrior = EmployService.new(params, mercenary).run
    render json: warrior, include: [:mercenary], status: 201
  end

  # Service Object for employ_best (Single Responsibility Principle)
  def employ
    return unless mercenary.available_from < Time.now

    warrior = EmployService.new(params, mercenary).run
    render json: warrior, include: [:mercenary], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end
end
