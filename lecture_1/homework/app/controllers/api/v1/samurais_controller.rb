module Api
  module V1
    class SamuraisController < ApplicationController
      def show
        render json: samurai.to_json(only: samurai_attributes)
      end

      def index
        samurais = samurais_status
        render json: samurais.to_json(only: samurai_attributes)
      end

      def create
        samurai = clan.samurais.new(samurai_params)

        if samurai.save
          render json: samurai.to_json(only: samurai_attributes), status: 201
        else
          render json: { errors: samurai.errors.messages }, status: 422
        end
      end

      def update
        if samurai.update(samurai_params)
          render json: samurai.to_json(only: samurai_attributes)
        else
          render json: { errors: samurai.errors.messages }, status: 422
        end
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
        params.permit(samurai_attributes)
      end

      def samurai_attributes
        %w[id name armor battle_count join_at death_at clan_id]
      end

      def samurais_status
        case ActiveModel::Type::Boolean.new.cast(params[:alive])
        when true
          clan.samurais.alive.first(limit)
        when false
          clan.samurais.dead.first(limit)
        else
          clan.samurais.first(limit)
        end
      end
    end
  end
end
