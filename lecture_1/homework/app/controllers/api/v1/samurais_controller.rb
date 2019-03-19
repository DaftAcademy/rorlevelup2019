module Api
  module V1
    class SamuraisController < ApplicationController
      def index
        if params.has_key?(:alive)
          if params[:alive] == "true"
            samurais = clan.samurais.alive
          elsif params[:alive] == "false"
            samurais = clan.samurais.dead
          else
            render json: "Wrong value for the key 'alive'".to_json,
                   status: 404 and return
          end
        else
          samurais = clan.samurais
        end
        render json: samurais.to_json(only: render_params)
      end

      def show
        render json: samurai.to_json(only: render_params)
      rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 404
      end

      def create
        samurai = clan.samurais.create!(samurai_params)

        render json: samurai.to_json(only: render_params), status: 201
      rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 422
      end

      def update
        samurai.update!(samurai_params)

        render json: samurai.to_json(only: render_params)
      rescue ActiveRecord::ActiveRecordError => e
        render json: e.to_json, status: 422
      end

      def destroy
        samurai.destroy!

        head 204
      rescue => e
        render json: e.to_json, status: 404
      end

      private

        def render_params
          %w[id name armor battles created_at died_at]
        end

        def samurai_params
          params.permit(:name, :armor, :battles, :died_at, :clan_id)
        end

        def clan
          Clan.find(params[:clan_id])
        end

        def samurai
          Samurai.find(params[:id])
        end
    end
  end
end
