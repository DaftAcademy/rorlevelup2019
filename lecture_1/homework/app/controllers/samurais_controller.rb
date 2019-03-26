class SamuraisController < ApplicationController

    # GET /clans/:clan_id/samurais
    def index
        samurais = clan.samurais

        samurais = filter_samurais(samurais, params)

        samurais = samurais.first(params[:limit].to_i) if params[:limit].present?

        render json: samurais.to_json(only: %w[id name armor battles join_date death_date])
    end

    # POST /clans/:clan_id/samurais
    def create
        begin
        clan.samurais.create!(samurai_params)
        render json: samurai.to_json(only: %w[id name armor battles join_date death_date]), status: 201
        rescue ActiveRecord::RecordInvalid => exception
            render json: exception.to_json(only %w[error]), status: 422
        end
    end

    # PUT /clans/:clan_id/samurais/:id
    def update
        begin
        samurai.update!(samurai_params)
        render json: samurai.to_json(only: %w[id name armor battles join_date death_date])
        rescue ActiveRecord::RecordInvalid => exception
            render json: exception.to_json(only %w[error]), status: 422
        end
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
        @samurai ||= clan.samurais.find(params[:id])
    end

    def samurai_params
        params.permit(:name, :armor, :battles, :join_date, :death_date)
    end

    def filter_samurais(samurais, params)
        samurais = filter_alive(samurais, params[:alive]) if params[:alive].present?
        return samurais
    end

    def filter_alive(samurais, is_alive)
        samurais = samurais.where(death_date: nil) if is_alive == 'true'
        samurais = samurais.where.not(death_date: nil) if is_alive == 'false'
        return samurais
    end

end

