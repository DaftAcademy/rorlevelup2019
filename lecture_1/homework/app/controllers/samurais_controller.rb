class SamuraisController < ApplicationController
  before_action :set_samurai, only: %i[show update destroy]
  before_action :set_clan,    only: %i[index create active inactive]

  def index
    render json: filter_samurais.to_json(only: %i[id name])
  end

  def show
    render json: @samurai.to_json(only: attributes)
  end

  def create
    samurai ||= @clan.samurais.create!(samurai_params)
    render json: samurai.to_json(only: attributes), status: 201
  end

  def update
    @samurai.update_attributes!(samurai_params)
      render json: @samurai.to_json(only: attributes)
  end

  def destroy
    @samurai.destroy!
    head 204
  end

  private

    def limit
      params.permit(:limit)[:limit] || 10
    end

    def samurai_params
      params.permit(:name, :combats, :armor, :joined, :died)
    end

    def set_clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def set_samurai
      @samurai ||= set_clan.samurais.find(params[:id])
    end

    def attributes
      %i[id name combats armor joined died clan_id]
    end

    def filter_samurais
      samurais ||= @clan.samurais.all

      if params[:dead] == "true"
        samurais.dead.first(limit.to_i)
      elsif params[:dead] == "false"
        samurais.alive.first(limit.to_i)
      else
        samurais.first(limit.to_i)
      end
    end
end
