module Api
  module V1
    class ClansController < ApplicationController
      def index
        clans = Clan.all

        render json: clans.to_json
      end

      def create
        clan = Clan.create!(clan_params)

        render json: clan.to_json, status: 201
      end

      private

        def clan_params
          params.permit(:name)
        end
    end
  end
end
