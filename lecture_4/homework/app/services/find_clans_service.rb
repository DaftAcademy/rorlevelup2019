# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class FindClansService
  def initialize(params)
    @params = params
  end

  def run
    if @params[:clan_id]
      Clan.find(@params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end
