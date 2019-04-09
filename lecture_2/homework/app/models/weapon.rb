class Weapon < ApplicationRecord
  enum kind: {
      magical: "magical",
      melee: "melee",
      ranged: "ranged"
  }
end
