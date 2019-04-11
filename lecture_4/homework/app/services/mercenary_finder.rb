# frozen_string_literal: true

class MercenaryFinder
  def initialize(action, id)
    @action = action
    @id = id
  end

  # Wydaje mi sie, ze troche tu zaczepilem o open /close - jesli bedziemy chcieli zmienic
  # nasze prferencje co do najemnikow (logiki wyszukwiania najlepszego wojownika),
  # to wystarczy zmienic logike lub wage udzialu price i experience w metodzie
  # best_mercenary, bez ingerowania w jakikowiek inny kod

  def call
    if @action == 'employ_best'
      best_mercenary
    elsif @action == 'employ'
      Mercenary.find(@id)
    end
  end

  private

  def best_mercenary
    price_part = 1
    experience_part = 4
    available_mercenary = Mercenary.where('available_from < ?', Time.now).where('warrior_id IS NULL')
    evaluation = available_mercenary.map { |mercenary|
      (mercenary.price * price_part) - (mercenary.experience * experience_part)
    }
    min = evaluation.min
    best_mercenary_index = evaluation.index(min)
    available_mercenary[best_mercenary_index]
  end
end
