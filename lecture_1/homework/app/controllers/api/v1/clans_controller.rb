module Api
  module V1
    class ClansController < ApplicationController
      def create
        clan = Clan.new(clan_params)

        if clan.save
        render json: clan.to_json(only: %i[id name]), status: 200
        else
        render json: { :error => clan.errors.full_messages }, status: 422
        end
      end

      def index
        clans = Clan.first(limit)

        render json: clans.to_json(only: %i[id name])
      end

      private

      def clan_params
        params.permit(:name)
      end

      def limit
        @limit ||= params[:limit] || 10
      end
    end
  end 
end

