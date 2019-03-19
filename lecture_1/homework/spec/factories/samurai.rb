FactoryBot.define do
  factory :samurai do
    name { "jon" }
    armor { 516 }
    battles_count { 19 }
    join_date { "2018-07-04" }
    death_date { nil }
    clan
  end
end
