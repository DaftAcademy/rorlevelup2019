module Clans
  class SamuraisController < ApplicationController
    def show
      render json: samurai.to_json
    end

    def index
      samurais = clan.samurais
      if params.key?(:alive)
        if params[:alive].to_i == 0
          render json: samurais.dead.to_json
        else
          render json: samurais.alive.to_json
        end
      else
        render json: samurais.to_json
      end
    end

    def create
      samurai = clan.samurais.create!(samurai_params)

      render json: samurai.to_json, status: 201
    end

    def update
      samurai.update!(samurai_params)

      render json: samurai.to_json
    end

    def destroy
      samurai.destroy!
    end

    private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def samurai
      @samurai ||= Samurai.find_by!(id: params[:id], clan_id: params[:clan_id])
    end

    def samurai_params
      params.permit(:name, :death_date, :armor_quality, :number_of_battles, :join_date)
    end
  end
end
