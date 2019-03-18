clans = Clan.create([
  { name: "Stary Obóz"},
  { name: "Nordmar"},
  { name: "Warszawka"}
])

Samurai.create( name: "Bezimienny",
                armour: 371,
                battles_count: 18,
                died_at: nil,
                joined_at: '2001-03-15',
                clan_id: Clan.first.id
                )

Samurai.create( name: "Ja-nusz",
                armour: 21,
                battles_count: 1,
                died_at: nil,
                joined_at: '1980-11-20',
                clan_id: clans[2].id
                )

Samurai.create( name: "Org1",
                armour: 100,
                battles_count: 2,
                died_at: '2019-03-15',
                joined_at: '1994-08-28',
                clan_id: clans[1].id
                )

Samurai.create( name: "Org2",
                armour: 100,
                battles_count: 2,
                died_at: '2019-03-15',
                joined_at: '1994-08-28',
                clan_id: clans[1].id
                )

Samurai.create( name: "Org3",
                armour: 100,
                battles_count: 2,
                died_at: '2019-03-15',
                joined_at: '1994-08-28',
                clan_id: clans[1].id
                )
