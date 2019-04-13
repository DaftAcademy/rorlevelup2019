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
    mercenary = Mercenary.where('available_from < ?', Time.now).order(price: :asc).first # TODO: what about experience?
    warrior = WarriorCreator.new(params,mercenary).call
  
    render json: warrior, include: [:mercenary, :building, :weapon], status: 201
  end

  def employ
    return unless mercenary.available_from < Time.now
    warrior = WarriorCreator.new(params,mercenary).call
    render json: warrior, include: [:mercenary, :building, :weapon], status: 201
  end

  private

  def mercenary
    @mercenary ||= Mercenary.find(params[:id])
  end
end
