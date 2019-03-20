
class SamuraisController < ApplicationController
  def index

    if params.has_key?(:clan_id)

      if params.has_key?(:alive)
          samurais = clan.samurais.where(died: nil)
      elsif params.has_key?(:dead)
          samurais = clan.samurais.where.not(died: nil)
      else
          samurais = clan.samurais.all
      end

    else
    
      samurais = Samurai.all

    end

    render json: samurais.to_json(only: %w[id name armour battle_counter joined died clan_id])
  end
  
  def destroy
    begin
      samurai.destroy!
      head 204
    rescue ActiveRecord::RecordNotFound => exc
        render json: exc.to_json(only: %w[error]), status: 404
    end
  end

  def update
    begin 
      samurai.update!(samurai_params)
      render json: samurai.to_json(only: %w[id name armour battle_counter joined died clan_id]), status: 201
    rescue ActiveRecord::RecordInvalid => exc
        render json: exc.to_json(only: %w[error]), status: 422
    end   
  end

  def show
      render json: samurai.to_json(only: %w[id name armour battle_counter joined dead clan_id])
  end

  def create
    begin
      samurai = clan.samurais.create!(samurai_params)
      render json: samurai.to_json(only: %w[id name]), status: 201
    rescue ActiveRecord::RecordInvalid => exc
        render json: exc.to_json(only: %w[error]), status: 422
    end
  end

  def samurai
      Samurai.find(params[:id])
  end

  def clan
      Clan.find(params[:clan_id])
  end

  def samurai_params
      params.permit(:name,:armour,:battle_counter,:joined,:died)
  end
  
end
