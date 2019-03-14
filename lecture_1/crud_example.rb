module Hordes
  class OrcsController < ApplicationController
    def show
      render json: orc.to_json(only: %w[id name power])
    end

    def index
      orcs = horde.orcs.first(params[:limit].to_i)

      render json: orcs.to_json(only: %w[id name power])
    end

    def create
      orc = horde.orcs.create!(orc_params)

      render json: orc.to_json(only: %w[id name power]), status: 201
    end

    def update
      orc.update!(orc_params)

      render json: orc.to_json(only: %w[id name power])
    end

    def destroy
      orc.destroy!

      head 204
    end

    private

    def orc
      @orc ||= horde.orcs.find(params[:id])
    end

    def horde
      @horde ||= Horde.find(params[:horde_id])
    end

    def orc_params
      params.permit(:name, :power)
    end
  end
end
