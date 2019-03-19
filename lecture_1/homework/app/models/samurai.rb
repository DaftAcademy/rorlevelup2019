class Samurai < ApplicationRecord
  belongs_to :clan
  validates :name, :protection, :battles, :join_date, presence: true
end
