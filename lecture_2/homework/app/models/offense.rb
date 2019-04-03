class Offense < ApplicationRecord
  belongs_to :offensible, polymorphic: true
end
