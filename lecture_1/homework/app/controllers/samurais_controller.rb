class SamuraisController < ApplicationController
  before_action :set_samurai, only: %i[show update destroy]
  before_action :set_clan,    only: %i[index create active inactive]

  def index
    samurais ||= @clan.samurais.first(limit_param.to_i)
    render json: samurais.to_json(only: %w[id name])
  end

  def show
    render json: @samurai.to_json(except: %w[created_at updated_at])
  end

  def create
    samurai ||= @clan.samurais.new(samurai_params)
    if samurai.save
      render json: samurai.to_json(except: %w[created_at updated_at]), status: 201
    else
      render json: { message: "Something went wrong!",
                     status: 422,
                     errors: samurai.errors.full_messages }, status: 422
    end
  end

  def update
    if @samurai.update_attributes(samurai_params)
      render json: @samurai.to_json(except: %w[created_at updated_at])
    else
      render json: { message: "Something went wrong!",
                     status: 422,
                     errors: @samurai.errors.full_messages }, status: 422
    end
  end

  def destroy
    @samurai.destroy!
    head 204
  end

  def active
    active = @clan.samurais.where(died: nil)
    render json: active.to_json(except: %w[created_at updated_at])
  end

  def inactive
    inactive = @clan.samurais.where("died")
    render json: inactive.to_json(except: %w[created_at updated_at])
  end

  private

    def limit_param
      params.permit(:limit)[:limit] || 10
    end

    def samurai_params
      params.permit(:name, :combats, :armor, :joined, :died)
    end

    def set_clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def set_samurai
      @samurai ||= clan.samurais.find(params[:id])
    end
end
