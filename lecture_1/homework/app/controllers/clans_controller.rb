class ClansController < ApplicationController

  # GET /clans
  def index
    clans = Clan.all

    render json: clans
  end

  # GET /clans/1
  def show
    render json: clan
  end

  # POST /clans
  def create
    clan = Clan.new(clan_params)

    if clan.save
      render json: clan, status: 201
    else
      render json: clan.errors, status: 422
    end
  end

  # PATCH/PUT /clans/1
  def update
    if clan.update(clan_params)
      render json: clan
    else
      render json: clan.errors, status: 422
    end
  end

  # DELETE /clans/1
  def destroy
    clan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def clan
      @clan ||= Clan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clan_params
      params.permit(:name)
    end
end
