module Api
  module V1
    class ClansController < ApplicationController
      def index
        clans = Clan.all

        render json: clans.to_json(only: %i[id name])
      end

      def create
        clan = Clan.create!(clan_params)

        if clan.save
          render json: clan.to_json(only: %w[id name]), status: 201
        else
          render json: { errors: clan.errors.messages }, status: 422
        end
      end

      private

      def clan_params
        params.permit(:name)
      end
    end
  end
end
