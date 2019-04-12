# frozen_string_literal: true

# Service Object - common part for employ_best & employ (DRY)
class ChooseMercenaryService
  def initialize(params)
    @params = params
  end

  def run
    sort_price_exp.first # Add to selection condition warrior experience
  end

  private

  def basic_sort
    Mercenary.where('available_from < ?', Time.now).where('warrior_id IS NULL')
  end

  def sort_price_exp
    basic_sort.sort_by { |t| [t.price, t.experience * -1] }
  end
end
