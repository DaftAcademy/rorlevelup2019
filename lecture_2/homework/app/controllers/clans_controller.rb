class ClansController < ApplicationController
  def index
    render json: Clan.all.to_json
  end

  def create
    clan = Clan.create!(clan_params)
    render json: clan.to_json, status: 201
	rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 422
  end
  
  def show
    render json: clan.to_json, status: 200
	rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 404
  end
  
  def update
    clan.update(clan_params)
	render json: clan.to_json, status: 201
	rescue ActiveRecord::ActiveRecordError => e
	  render json: e.to_json, status: 422
  end
  
  def destroy
    clan.destroy!
    head 204
    rescue ActiveRecord::ActiveRecordError => e
      render json: e.to_json, status: 404
  end

  private
  
  def clan
    Clan.find(params[:id])
  end

  def clan_params
    params.permit(:name, :id)
  end
end
