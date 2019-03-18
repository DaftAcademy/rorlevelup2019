class ClansController < ApplicationController
  before_action :set_clan, only: %i[show update destroy]

  def index
    clans = Clan.first(limit_param.to_i)
    render json: clans.to_json(only: %w[id name])
  end

  def show
    render json: @clan.to_json(only: %w[id name])
  end

  def create
    clan = Clan.new(clan_params)
    if clan.save
      render json: clan.to_json(only: %w[id name]), status: 201
    else
      render json: { message: "Something went wrong!",
                     status: 422,
                     errors: clan.errors.full_messages }, status: 422
    end
  end

  def update
    if @clan.update(clan_params)
      render json: @clan.to_json(only: %w[id name])
    else
      render json: { message: "Something went wrong!",
                     status: 422,
                     errors: @clan.errors.full_messages }, status: 422
    end
  end

  def destroy
    @clan.destroy!
    head 204
  end

  private

    def limit_param
      params.permit(:limit)[:limit] || 10
    end

    def clan_params
      params.permit(:name)
    end

    def set_clan
      @clan = Clan.find(params[:id])
    end
end
