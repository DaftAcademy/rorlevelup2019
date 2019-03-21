class ClansController < ApplicationController
  before_action :set_clan, only: %i[show update destroy]

  def index
    clans = Clan.first(limit.to_i)
    render json: clans.to_json(only: attributes)
  end

  def show
    render json: @clan.to_json(only: attributes)
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json(only: attributes), status: 201
  end

  def update
    @clan.update_attributes!(clan_params)
    render json: @clan.to_json(only: attributes)
  end

  def destroy
    @clan.destroy!
    head 204
  end

  private

    def limit
      params.permit(:limit)[:limit] || 10
    end

    def clan_params
      params.permit(:name)
    end

    def set_clan
      @clan = Clan.find(params[:id])
    end

    def attributes
      %i[id name]
    end
end
