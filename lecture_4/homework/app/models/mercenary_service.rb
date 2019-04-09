class MercenaryService
  def initialize(params:)
    @clan = find_clan(params)
  end

  private

  def find_clan(params)
    if params[:clan_id]
      Clan.find(params[:clan_id])
    else
      Clan.order(warriors_count: :desc).first
    end
  end
end