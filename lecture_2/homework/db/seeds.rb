Clan.delete_all

CLAN_NAMES = %w[ Yakuza Zaibatsu Ku_Kul_Ska Loonies Scientists Hare_Krishna Rednecs Russian Yutes ].freeze
WARRIORS_KINDS = %w[ Archer Hussar Peasant Samurai Wizard ]


WARRIORS_NAME = ['Akihiko', 'Akihiro', 'Akihisa', 'Akihito', 'Akimasa', 'Akimitsu', 'Akinari', 'Akinobu', 'Akinori', 'Akio', 'Akisada', 'Akitake', 'Akito', 'Akitoshi', 'Akitsugu', 'Akiya', 'Akiyoshi', 'Akiyuki', 'Arata', 'Arihiro', 'Arinaga', 'Arinobu', 'Aritomo', 'Asahiko', 'Asao', 'Atomu', 'Atsuhiko', 'Atsuhiro', 'Atsuji', 'Atsuki', 'Atsunobu', 'Atsuo', 'Atsushi', 'Atsuto', 'Atsuya', 'Azuma', 'Banri', 'Bunji', 'Bunta', 'Chikao', 'Chikashi', 'Chikayoshi', 'Dai', 'Daichi', 'Daigo', 'Daihachi', 'Daiji', 'Daiju', 'Daiki', 'Dairoku', 'Daisaku', 'Daishi', 'Daishin', 'Daisuke', 'Eiichi', 'Eiichiro', 'Eiji', 'Eikichi', 'Einosuke', 'Eisaku', 'Eisen', 'Eishun', 'Eisuke', 'Eita', 'Emon', 'Etsuji', 'Fujio', 'Fumiaki', 'Fumihiko', 'Fumihiro', 'Fuminori', 'Fumio', 'Fumitaka', 'Fumito', 'Fumiya', 'Fusanosuke', 'FusazaneFutoshi', 'Gaku', 'Gakuto', 'Gen', 'Hakaru', 'Haruaki', 'Haruchika', 'Haruhiko', 'Haruhiro', 'Haruhisa', 'Haruki', 'Harukichi', 'Harunobu', 'Harunori', 'Haruo', 'Harutaka', 'Haruto', 'Haruya', 'Haruyoshi', 'Hatsuo', 'Hayanari', 'Hayao', 'Hayata', 'Hayato', 'Hideaki', 'Hideharu', 'Hidehiko', 'Hidehisa', 'Hidehito', 'Hideji', 'Hidekazu', 'Hideki', 'Hidemaro', 'Hidemasa', 'Hidemi', 'Hidemitsu', 'Hidenobu', 'Hidenori', 'Hideo', 'Hideshi', 'Hirofumi', 'Hirohide', 'Hirohisa', 'Hiroji', 'Hirokatsu', 'Hirokazu', 'Hiroki', 'Hirokuni', 'Hiromasa', 'Hiromichi', 'Hiromitsu', 'Hiromori', 'Hiromoto', 'Hironari', 'Hironobu', 'Hironori', 'Hirotami', 'Hiroto', 'Hirotoki', 'Hirotomo', 'Hirotoshi', 'Hirotsugu', 'Hiroya', 'Hiroyasu', 'Hiroyoshi', 'Hiroyuki', 'Hisaharu', 'Hisahito', 'Hisaichi', 'Hisaki', 'HisamitsuHisamoto', 'Hisanobu', 'Hisanori', 'Hisao', 'Hisashi', 'Hisataka', 'Hisateru', 'Hisato', 'Hisatsugu', 'Hisayasu', 'Hisayoshi', 'Hisayuki', 'Hitoshi', 'Hokuto', 'Hozumi', 'Iehiro', 'Iehisa', 'Iemasa', 'Iemon', 'Iesada', 'Ikki', '(given', 'name)', 'Ikko', 'Ikuo', 'Ippei', 'Isami', 'Isamu', 'Isao', 'Issei', 'Junki', 'Junpei', 'Junto', 'Kagemori', 'Kagenori', 'Kagetaka', 'Kaichi', 'Kaii', 'Kaiji', 'Kaisei', 'Kaito', 'Kakichi', 'Kaku', '(name)', 'Kakuji', 'Kamon', '(name)', 'Kanehira', 'Kanehiro', 'Kanehisa', 'Kanemaru', 'Kanematsu', 'Kanemoto', 'Kanesuke', 'Kanetake', 'Kaneto', 'Kanetsugu', 'Kaneyoshi', 'Katsuhiro', 'Katsuhisa', 'Katsuhito', 'Katsuji', 'Katsuki', 'Katsukiyo', 'Katsumasa', 'Katsumoto', 'Katsunaga', 'Katsunari', 'Katsunori', 'Katsunosuke', 'Katsuo', 'Katsushi', 'Katsusuke', 'Kunihiko', 'Kunihiro', 'Kunihisa', 'Kunimasa', 'Kunimitsu', 'Kunio', 'Kunishige', 'Kunitake', 'Kuniyoshi', 'Kuniyuki', 'Kuranosuke', 'Kusuo', 'Mahiro', 'Makio', 'Makito', 'Mamoru', 'Manabu', 'Masabumi', 'Masachika', 'Masafumi', 'Masaharu', 'Masahide', 'Masahiko', 'Masahiro', 'Masahisa', 'Masahito', 'Masaichi', 'Masaie', 'Masaji', 'Masakage', 'Masakatsu', 'Masakazu', 'Masakuni', 'Masamichi', 'Masamitsu', 'Masamori', 'Masamune', '(disambiguation)', 'Masamura', 'Masanao', 'Masanari', 'Masanobu', 'Masanori', 'Masanosuke', 'Masao', 'Masaomi', 'Masaru', 'Masashi', 'Masashige', 'Masataka', 'Masatak', 'Mitsugi', 'Mitsugu', 'Mitsuharu', 'Mitsuhide', 'Mitsuhiko', 'Mitsuhira', 'Mitsuhiro', 'Mitsuhisa', 'Mitsumasa', 'Mitsumori', 'Mitsunobu', 'Mitsunori', 'Nagaharu', 'Nagahide', 'Nagamasa', 'Nagamichi', 'Naganao', 'Naganori', 'Nagatoki', 'Nagatomo', 'Namio', 'Nankichi', 'Naofumi', 'Naoharu', 'Naohiko', 'Naohiro', 'Naohisa', 'Naohito', 'Naoji', 'Naokatsu', 'Naoki', 'Naomasa', 'Naomichi', 'Naomori', 'Naonobu', 'Naoshi', 'Naotaka', 'Naotake', 'Naoto', 'Naoya', 'Naoyuki', 'Naozumi', 'Nariaki', 'Nariakira', 'Naritaka', 'Nobuatsu', 'Nobuharu', 'Nobuhiko', 'Nobuhiro', 'Nobuhisa', 'Nobuhito', 'Nobukatsu', 'Nobukazu', 'Nobumasa', 'Nobumitsu', 'Nobumoto', 'Nobunao', 'Nobunari', 'Nobuo', 'Nobusada', 'Nobusuke', 'Nobutada', 'Nobutaka', 'Nobuteru', 'Osamu', 'Otohiko', 'Raizo', 'Reiichi', 'Reiji', 'Sadaaki', 'Sadaharu', 'Sadahiko', 'Sadahiro', 'Sadakazu', 'Sadanaga', 'Sadao', '(given', 'name)', 'Sadatoshi', 'Sadayoshi', 'Sadazane', 'Saiichi', 'Sakichi', 'Sanji', '(given', 'name)', 'Sankichi', 'Shigeharu', 'Shigehiro', 'Shigehisa', 'Shigekazu', 'Shigeki', 'Shigemasa', 'Shigematsu', 'Shigemi', 'Shigemitsu', 'Shigemoto', 'Shigenaga', 'Shigenobu', 'Shigenori', 'Shigeo', 'Shigeru', 'Shigetada', 'Shigetaka', 'Shigeto', 'Shigetoshi', 'Shigeyasu', 'Shigeyoshi', 'Shigeyuki', 'Tadaaki', 'Tadachika', 'Tadafumi', 'Tadaharu', 'Tadahiko', 'Tadahiro', 'Tadahito', 'Tadakatsu', 'Tadamasa', 'Tadami', 'Tadamori', 'Tadanaga', 'Tadanao', 'Tadanari', 'Tadanobu', 'Tadanori', 'Tadao', 'Tadaoki', 'Tadashi', 'Tadataka', 'Tadateru', 'Tadatomo', 'Tadatoshi', 'Tadatsugu', 'Tadatsune', 'Tadayo', 'Tadayoshi', 'Tadayuki', 'Taichi', 'Teruhisa', 'Teruichi', 'Teruki', 'Terumasa', 'Terunobu', 'Teruo', 'Teruyoshi', 'Teruyuki', 'Tetsu', 'Tetsuharu', 'Tetsuhiro', 'Yahiko', 'Yahiro', 'Yanosuke', 'Yashiro', 'Yasuaki', 'Yasufumi', 'Yasuharu', 'Yasuhide', 'Yasuhiko', 'Yasuhiro', 'Yasuhisa', 'Yasuji', 'Yoshifumi', 'Yoshiharu', 'Yoshihide', 'Yoshihiko', 'Yoshihiro', 'Yoshihisa', 'Yoshihito', 'Yoshiie', 'Yoshikane', 'Yoshikatsu', 'Yoshikazu', 'Yoshiki', 'Yoshikiyo', 'Yoshikuni', 'Yoshimasa', 'Zenjiro', 'Zenkichi'].freeze
CLAN_NAMES.each do |clan|
  Clan.create(name: clan)
end

CLAN_NAMES.count.times do 
  Constructions::Barricade.create!
  Constructions::Trench.create!
  Constructions::BatteringRam.create!
  Constructions::Bunker.create!
  Constructions::Stronghold.create!
end

CONSTRUCTION_NAMES = %w[ Barricade Trench BatteringRam Bunker Stronghold]


WARRIORS_NAME.each do |warrior|
  war = Warrior.create(
    name: warrior,
    armor_quality: rand(100),
    number_of_battles: rand(100),
    join_date: Date.today - rand(1000).days,
    clan_id: Clan.find_by_name(CLAN_NAMES.sample).id,
    kind: WARRIORS_KINDS.sample,
    defensible_type: CONSTRUCTION_NAMES.sample)

  #it wouldn't be good idea to keep warriors from enemy clans in the same construcitons
    war.defensible_id = war.clan_id
    war.save

  next unless rand(10) >= 7

  joining_time = (Date.today - war.join_date).to_i
  war.death_date = war.join_date + rand(joining_time).days
  if war.save!
    puts "#{warrior} created"
  else
    puts "#{warrior} not created"
  end
end
