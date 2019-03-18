class ClansController < ApplicationController
  def index
      clans = Clan.all

      render json: clans.to_json(only: %w[id name])
    end

    def create
      clan = Clan.create(clan_params)

      render json: clan.to_json(only: %w[id name]), status: 201
    end

   private

    def clan_params
      params.require(:clan).permit(:name)
    end
end
