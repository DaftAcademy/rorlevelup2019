
class ClansController < ApplicationController
    def index
      clans = Clan.all
      render json: clans.to_json(only: %w[id name])
    end
  
    def show
      render json: clan.to_json(only: %w[id name])
    end
  
    def create
      begin
        clan = Clan.create!(clan_params)
        render json: clan.to_json(only: %w[name]), status: 201
      rescue ActiveRecord::RecordInvalid => exc
        render json: exc.to_json(only: %w[error]), status: 422
      end   
    end
  
    def update
      begin
        clan.update!(clan_params)
        render json: clan.to_json(only: %w[name]), status: 201
      rescue ActiveRecord::RecordInvalid => exc
        render json: exc.to_json(only: %w[error]), status: 422
      end   
    end
  
    def destroy
      begin
        clan.destroy!
        head 204
      rescue ActiveRecord::RecordNotFound => exc
        render json: exc.to_json(only: %w[error]), status: 404
      end
    end
  
    private
  
    def clan
      Clan.find(params[:id])
    end
  
    def clan_params
      params.permit(:name)
    end
  end