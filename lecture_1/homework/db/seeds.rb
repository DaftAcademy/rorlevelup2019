# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


clans = %w(icz ni san jon go)
death_days = (1.month.ago.to_date..Date.today.to_date).to_a
join_days = (1.year.ago.to_date..5.weeks.ago.to_date).to_a

clans.each do |clan|
  new_clan = Clan.create(name: clan)
  rand(5..12).times do |n|
    death_date = (rand(3) == 0 ? death_days[rand(death_days.count)] : nil )
    join_date = join_days[rand(join_days.count)]
    new_clan.samurais.create(name: "#{new_clan}_san_#{n}", armor: rand(1001),
                            battles_count: rand(20), death_date: death_date,
                            join_date: join_date)
  end
end
