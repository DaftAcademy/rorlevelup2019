class SamuraisController < ApplicationController
  # GET /samurais
  def index
    if(params[:alive].present?)
      if(params[:alive] == "true")
        samurais = clan.samurais.where.not(death: nil)
      elsif(params[:alive] == "false")
        samurais = clan.samurais.where(death: nil)
      end
    else
     samurais = clan.samurais.all()
    end
    render json: samurais.to_json()
  end

  # GET /samurais/1
  def show
    render json: samurai.to_json()
  end

  # POST /samurais
  def create
    samurai = clan.samurais.new(samurai_params)

    if samurai.save
      render json: samurai, status: :created
    else
      render json: samurai.errors, status: 422
    end
  end

  # PATCH/PUT /samurais/1
  def update
    if samurai.update(samurai_params)
      render json: samurai
    else
      render json: samurai.errors, status: 422
    end
  end

  # DELETE /samurais/1
  def destroy
    samurai.destroy!
  end

  def alive
    render json: clan.samurais.where(death: nil).to_json
  end

  def dead
    render json: clan.samurais.where.not(death: nil).to_json
  end

  private

    def clan
      @clan ||= Clan.find(params[:clan_id])
    end

    def samurai
      @samurai ||= clan.samurais.find(params[:id])
    end

    def samurai_params
      params.permit(:name, :armor, :skirmishes, :death, :joined)
    end

end
