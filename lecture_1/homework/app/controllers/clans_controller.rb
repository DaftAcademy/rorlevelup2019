class ClansController < ApplicationController
    def index
      begin
        clans = Clan.all()
        render json: clans.to_json(), status: 200
      rescue ActiveRecord::ActiveRecordError => e
        render json:  e.as_json, status: 422
      end
    end
      
      def create
        begin
          clan = Clan.create(clan_params)
          render json: clan.to_json(), status: 200
        rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
        end
      end

      def show
        begin
          clan = Clan.find(params[:id])
          render json: clan.to_json(), status: 200
        rescue ActiveRecord::ActiveRecordError => e
          render json:  e.as_json, status: 422
        end
      end

      def clan_params
        params.permit(:name)
      end


end
