class Fortress < ApplicationRecord
    has_many :warriors, as: :defensible
    validates :name, presence: true
    validates :fosse, inclusion: { in:[true,false]}
end
