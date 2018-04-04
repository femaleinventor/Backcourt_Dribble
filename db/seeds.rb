# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BCD_for_CSV_teams.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Team.new
  t.name = row['name']
  t.abbreviation = row['abbreviation']
  t.home_field = row['home_field']
  t.nickname = row['nickname']
  t.bright_color = row['bright_color']
  t.light_color = row['light_color']
  t.dark_color = row['dark_color']
  t.twitter_list = row['twitter_list']
  t.save
end


# country_list = [
#   [ "Deutschland", 81831000 ],
#   [ "Frankreich", 65447374 ],
#   [ "Belgien", 10839905 ],
#   [ "Niederlande", 16680000 ]
# ]
#
# country_list.each do |country|
#   Country.create( :name => country[0], :population => country[1] )
# end

sport_list = [
  [ "Soccer", /../assets/images/small_sports/soccer_ball.png ],
  [ "BasketBall", /../assets/images/small_sports/basket_ball.png],
  [ "Rugby", /../assets/images/small_sports/rugby_ball.png],
  [ "Ice Hockey", /../assets/images/small_sports/ice_hockey.png],
  [ "Tennis", /../assets/images/small_sports/tennis_ball.png],
  [ "Volleyball", /../assets/images/small_sports/tennis_ball.png]
]

sports_list.each do |sport|
  Sport.create ( :name => country[0], :image_url => country[1] )
end

# how do i add foreign key information to seed data? #SPORT_ID
league_list = [
  [ "FIFA (Worldwide National Teams)", "FIFA", 1],
  [ "National Women's Soccer League (USA)", "NWSL", 1],
  [ "Allianz Frauen-Bundesliga (Germany)", "Frauen-Bundesliga", 1],
  [ "FA Women's Super League (England)", "FA Super League", 1],
  [ "UEFA Women's Champions League Champion's League (Europe)", 1 ],
  [ "National Women’s League (New Zealand)", "NWL", 1 ],
  [ "Westfield W-League (Australia)", "W-League", 1],
  [ "Liga MX Femenil (Mexico)", "Liga MX", 1],
  [ "Primera División Femenina (Spain)", "Primera División", 1],
  [ "Serie A Women (Italy)", "Serie A", 1],
  [ "FA Women's Championship (England)", "FA Championship", 1],
  [ "Damallsvenskan (Sweden)", "Damallsvenskan", 1],
  [ "Division 1 Féminine (France)", "Division 1", 1],
  [ "Indian Women's Football League (India)", "IWFL", 1],
  [ "Kowsar Women Football League (Iran)", "Kowsar", 1],
  [ "Iraqi Women's Premier League (Iraq)", "Iraqi PL", 1],
  [ "Nadeshiko League[ (Japan)", "Nadeshiko", 1],
  [ "WK League (South Korea)", "WK", 1],
  [ "Thai Women's Premier League (Thailand)", "Thai League", 1],
  [ "Algerian Championship (Algeria)", "Algerian League", 1],
  [ "Egyptian League (Egypt)", "Egyptian League", 1],
  [ "Kenyan Premier League (Kenya)", "Kenyan League", 1],
  [ "Botola (Morocco)", "Botola", 1],
  [ "Nigerian Championship (Nigeria)", "Nigerian Championship", 1],
  [ "Tunisian Ligue (Tunisia)", "Tunisian Ligue", 1],
  [ "Copa do Brasil de Futebol Feminino (Brazil)", "CBFF", 1],
  [ "Frauenliga (Austria)", "Frauenliga", 1],
  [ "Premier League (Belarus)", "Balarus Premier", 1],
  [ "Super League (Belgium)", "Super League", 1],
  [ "Eredivisie (Netherlands)", "Erdivisie", 1],
  [ "Estonia League (Estonia)", "Estonian League", 1],
  [ "Hong Kong League (Hong Kong)", "Hong Kong League", 1],
  [ "Vietnam League (Vietnam)", "Vietnam League", 1],
  [ "Malta League (Malta)", "Malta League", 1],
  [ "Toppserien (Norway)", "Toppserien", 1],
  [ "Kadınlar 1. Futbol Ligi (Turkey)", "K1FL", 1],
  [ "National Collegiate Athletic Association Division 1 Soccer (USA)", "NCAA Soccer D1", 1],
  [ "National Collegiate Athletic Association Division 1 Soccer (USA)", "NCAA Soccer D2", 1],
  [ "Women's National Basketball Association (USA)", "WNBA", 2],
  [ "Women's National Basketball League (Australia)", "WNBL", 2],
  [ "Russian Women's Basketball Premier League (Russia)", "RWBL", 2],
  [ "Liga Femenina de Baloncesto (Spain)", "LFB", 2],
  [ "Turkish Women's Basketball League‎ (Turkey)", "TWBL", 2],
  [ "First Women's Basketball League of Serbia (Serbia)", "FWBLS", 2],
  [ "Women's British Basketball League (England)", "WBBL", 2],
  [ "National Collegiate Athletic Association Division 1 BasketBall (USA)", "NCAA BasketBall D1", 2],
  [ "National Collegiate Athletic Association Division 2 BasketBall (USA)", "NCAA BasketBall D2", 2],
  [ "National Collegiate Athletic Association Division 1 Rugby (USA)", "NCAA Rugby D1", 3],
  [ "National Collegiate Athletic Association Division 1 Ice Hockey (USA)", "NCAA Ice Hockey D1", 4],
  [ "National Collegiate Athletic Association Division 1 Tennis (USA)", "NCAA Tennis D1", 5],
  [ "National Collegiate Athletic Association Division 1 Volleyball (USA)", "NCAA Volleyball D1", 6],
  [ "Women's Rugby League World (Worldwide National Teams)", "WR", 3],
  [ "The Women's Premier League (USA)", "WPL", 3],
  [ "Rugby Football League (United Kingdom)", "RFL", 3],
  [ "Australian Women's Rugby League (Australia)", "AWRL", 3],
  [ "Rugby Football League (England)", "RFL", 3],
  [ "National Women's Hockey League (USA)", "NWHL", 4],
  [ "Canadian Women's Hockey League (USA)", "CWHL", 4],
  [ "Women's Tennis Association (USA)", "WTA", 5],
  [ "Canadian Women's Hockey League (USA)", "CWHL", 6],
]
