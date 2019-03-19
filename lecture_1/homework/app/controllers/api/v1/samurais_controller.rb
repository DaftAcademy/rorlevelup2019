module Api
  module V1
    class SamuraisController < ApplicationController  
      def index
        samurais = choose_samurais_group
        
        render json: samurais.to_json(only: samurai_traits)
      end
      
      def show
        render json: samurai.to_json(only: samurai_traits)
      end

      def create
        samurai = clan.samurais.create!(samurai_params)

        render json: samurai.to_json(only: samurai_traits), status: 201
      end

      def update
        samurai.update!(samurai_params)

        render json: samurai.to_json(only: samurai_traits)
      end

      def destroy
        samurai.destroy!

        head 204
      end

      private

      def choose_samurais_group
        params[:dead].empty? ? clan.samurais : dead_or_alive
      end

      def dead_or_alive
        params[:dead] == 'true' ? clan.samurais.dead : clan.samurais.alive
      end

      def samurai
        @samurai ||= clan.samurais.find(params[:id])
      end

      def clan
        @clan ||= Clan.find(params[:clan_id])
      end

      def samurai_params
        params.permit(:name, :armor, :battles, :join_date, :death_date, :clan_id)
      end

      def samurai_traits
        %w[name armor battles join_date death_date clan_id]
      end
    end
  end
end
  