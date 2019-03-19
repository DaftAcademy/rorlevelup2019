module Api
  module V1
    class SamuraisController < ApplicationController
      def show 

        render json: samurai.to_json(only: SAMURAI_ATTRIBUTES)
      end

      def index

      end

      def create
        samurai = clan.samurais.new(samurai_params)

        if samurai.save?
          render json: samurai.to_json(only: SAMURAI_ATTRIBUTES), status: 201
        else
          render json: { :errors => samurai.errors.full_messages }, status: 422
        end
      end

      def update
        if samurai.update(samurai_params)
          render json: samurai.to_json(only: SAMURAI_ATTRIBUTES), status: 201
        else
          render json: { :errors => samurai.errors.full_messages }, status: 422
        end
      end

      def destroy
        samurai.destroy!

        head 204
      end
      
      private

      SAMURAI_ATTRIBUTES = %i[clan_id name armor fought_battles join_in death_time]

      def samurai_params
        permit.params(SAMURAI_ATTRIBUTES)
      end

      def clan
        @clan ||= Clan.find(params[:clan_id])
      end

      def samurai
        @samurai ||= clan.samurais.find(params[:clan_id])
      end

      def set_samurai
        samurais = Samurai.where(death_time: nil)
      end
    end
  end 
end 
