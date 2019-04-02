class SamuraisController < ApplicationController
	def show
	  render json: samurai.to_json(samurais_params)
	end

	def index
	  samurais = samurais_status
	  render json: samurais.to_json

	end

	def create
		samurai = clan.samurais.new(samurais_params)
		if samurai.save
			render json: samurai.to_json, status: 201
		else
			render json: { error: samurai.errors.messages }, status: 422
		end
	end

	def update
		if samurai.update(samurais_params)
			render json: samurai.to_json
		else
			render json: { errors: samurai.error.messages }, status: 422
		end
	end

	def destroy
		samurai.destroy!
		head 204
	end

	def samurais_params
		params.permit(:id, :name, :armor, :battles, :join_date, :death_date, :clan_id)
	end

	def clan
		@clan ||= Clan.find(params[:clan_id])
	end

	def samurai
		@samurai ||= clan.samurais.find(params[:id])
	end

	def samurais_status
        if params[:alive].blank?
          clan.samurais.all
        elsif params[:alive] == 'true'
          clan.samurais.alive.all
        elsif params[:alive] == 'false'
          clan.samurais.dead.all
        end
    end
end
