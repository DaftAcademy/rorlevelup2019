class SamuraisController < ApplicationController

    # GET /clans/:clan_id/samurais
    def index
        if params[:alive].present?
            if params[:alive] == "false"
                samurais = clan.samurais.where.not(death_date: nil)
            elsif params[:alive] == "true"
                samurais = clan.samurais.where(death_date: nil)
            end
        else
            samurais = clan.samurais
        end

        if params[:limit].present?
            samurais = samurais.first(params[:limit].to_i)
        end

        render json: samurais.to_json(only: %w[id name armor battles join_date death_date])
    end

    # POST /clans/:clan_id/samurais
    def create
        samurai = clan.samurais.create!(samurai_params)
        render json: samurai.to_json(only: %w[id name armor battles join_date death_date]), status: 201
    end

    # PUT /clans/:clan_id/samurais/:id
    def update
        samurai.update!(samurai_params)
        render json: samurai.to_json(only: %w[id name armor battles join_date death_date])
    end

    # DELETE /clans/:clan_id/samurais/:id
    def destroy
        samurai.destroy!
        head 204
    end

    private
    
    def clan
        Clan.find(params[:clan_id])
    end

    def samurai
        clan.samurais.find(params[:id])
    end

    def samurai_params
        params.permit(:name, :armor, :battles, :join_date, :death_date)
    end

end

