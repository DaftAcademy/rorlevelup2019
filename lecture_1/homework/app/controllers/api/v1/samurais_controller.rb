module Api
  module V1
    class SamuraisController < ApplicationController  
      def index
        render json: clan.samurais.to_json(only: %w[id name armor battles join_date death_date clan_id])
      end
      
      def show
        render json: samurai.to_json(only: %w[id name armor battles join_date death_date clan_id])
      end

      def create
        samurai = clan.samurais.create!(samurai_params)

        render json: samurai.to_json(only: %w[name armor battles join_date death_date clan_id]), status: 201
      end

      def update
        samurai.update!(samurai_params)

        render json: samurai.to_json(only: %w[name armor battles join_date death_date])
      end

      def destroy
        samurai.destroy!

        head 204
      end

      private

      def samurai
        @samurai ||= clan.samurais.find(params[:id])
      end

      def clan
        @clan ||= Clan.find(params[:clan_id])
      end

      def samurai_params
        params.permit(:name, :armor, :battles, :join_date, :death_date, :clan_id)
      end
    end
  end
end
  