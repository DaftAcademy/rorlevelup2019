# frozen_string_literal: true

class StrongholdsController < ApplicationController
  def index
    render json: Stronghold.all
  end

  def show
    render json: stronghold
  end

  def create
    stronghold = Stronghold.create!(stronghold_params)
    render json: stronghold
  end

  private

  def stronghold
    @stronghold ||= Stronghold.find(params[:id])
  end

  def stronghold_params
    params.permit(:name)
  end
end
