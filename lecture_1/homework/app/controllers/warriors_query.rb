class WarriorsQuery
    def self.belonging_to_clan(clan_id:, relation: Warrior)
        relation.where(clan_id: clan_id)
    end

    def self.having_birthday(relation: Warrior)
        relation.where(birthday: Date.today)
    end
end