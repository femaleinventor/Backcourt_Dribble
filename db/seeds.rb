# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Team.destroy_all
# League.destroy_all
# Match.destroy_all
# Sport.destroy_all
# Prediction.destroy_all


# seed file has already been run
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BCD_for_CSV_teams.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Team.new
  t.name = row['name']
  t.abbreviation = row['abbreviation']
  t.nickname = row['nickname']
  t.bright_color = row['bright_color']
  t.light_color = row['light_color']
  t.dark_color = row['dark_color']
  t.twitter_list = row['twitter_list']
  t.sport_id = row['sport_id']
  t.save!
end


#Initializing sports

sport_list = [
  [ "Soccer", "/../assets/images/small_sports/soccer_ball.png" ],
  [ "BasketBall", "/../assets/images/small_sports/basket_ball.png"],
  [ "Rugby", "/../assets/images/small_sports/rugby_ball.png"],
  [ "Ice Hockey", "/../assets/images/small_sports/ice_hockey.png"],
  [ "Tennis", "/../assets/images/small_sports/tennis_ball.png"],
  [ "Volleyball", "/../assets/images/small_sports/tennis_ball.png"]
]

sport_list.each do |sport|
  Sport.create!(name: sport[0], image_url: sport[1])
end

# # how do i add foreign key information to seed data? #SPORT_ID
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
  [ "Women's Tennis Association (USA)", "WTA", 5],
  [ "Canadian Women's Hockey League (USA)", "CWHL", 4]
]

league_list.each do |league|
  League.create!(name: league[0], abbreviation: league[1], sport_id: league[2])
end

# leagues_and_teams = [
#   [1,15],
#   [1,16],
#   [1,17],
#   [1,20],
#   [1,21],
#   [1,22],
#   [1,23],
#   [1,26],
#   [1,27],
#   [1,28],
#   [1,29],
#   [1,32],
#   [1,33],
#   [1,34],
#   [1,35],
#   [2,5],
#   [2,6],
#   [2,7],
#   [2,8],
#   [2,9],
#   [2,10],
#   [2,11],
#   [2,12],
#   [2,13]
# ]


venues_list = [
  [ "Toyota Park", "venues/Toyota_Park.jpg", "7000 Harlem Ave, Bridgeview, IL 60455", "America/Chicago"],
  [ "BBVA Compass Stadium", "venues/BBVA_Compass.jpg", "2200 Texas St, Houston, TX 77003", "America/Chicago"],
  [ "WakeMed Soccer Park", "venues/Wake_Med.jpg", "201 Soccer Park Dr, Cary, NC 27511", "America/New_York"],
  [ "Orlando City Stadium", "venues/Orlando.jpg", "655 W Church St, Orlando, FL 32805", "America/New_York"],
  [ "Providence Park", "venues/Providence_Park.png", "1844 SW Morrison St, Portland, OR 97205","America/Los_Angeles"],
  [ "Memorial Stadium", "venues/Memorial_Stadium.jpg", "401 5th Ave N, Seattle, WA 98109", "America/Los_Angeles"],
  [ "Yurcak Field", "venues/Yurcak_Field.jpg", "83 Fitch Rd, Piscataway Township, NJ 08854", "America/New_York"],
  [ "Rio Tinto Stadium", "venues/Rio_Tinto_Stadium.jpeg", "9256 State St, Sandy, UT 84070", "America/Denver"],
  [ "Maryland SoccerPlex", "venues/Maryland_Soccerplex.jpeg", "18031 Central Park Cir, Boyds, MD 20841", "America/New_York"],
  [ "Audi Field", "venues/Audi_Field.jpg", "32-60 R St SW, Washington, DC 20024", "America/New_York"],
  [ "Avaya Stadium", "venues/Avaya_Stadium.png", "1123 Coleman Ave, San Jose, CA 95110","America/Los_Angeles"],
  [ "EverBank Field", "venues/Everbank_Field.jpg", "1 Everbank Field Dr, Jacksonville, FL 32202", "America/New_York"],
  [ "Talen Energy Stadium", "venues/Talen_Energy_Stadium.jpg", "1 Stadium Dr, Chester, PA 19013", "America/New_York"],
  [ "FirstEnergy Stadium", "venues/FirstEnergy_Stadium.jpg", "100 Alfred Lerner Way, Cleveland, OH 44114", "America/Chicago"],
  [ "Stade Guy-Piriou", "venues/Stade_Guy-Pirious.jpg", "13 Rue de Keriolet, 29900 Concarneau", "Europe/Paris"]
]


venues_list.each do |venue|
  Venue.create!(name: venue[0], picture_url: venue[1], address: venue[2], timezone: venue[3])
end



# should home, away, or tie be numbers?
# [ "result", "channel", "league_id", "away_team_id", "home_team_id", "sport_id", "venue_id", "start" ],
matches_list = [
  [ "home", "Lifetime", 2, 7, 12, 1, 7, DateTime.new(2018,3,24,12,15)],
  [ "tie", "go90 App", 2, 12, 8, 1, 3, DateTime.new(2018,3,24,12)],
  [ "away", "go90 App", 2, 13, 10, 1, 5, DateTime.new(2018,3,24,12)],
  [ "home", "Lifetime", 2, 9, 11, 1, 3, DateTime.new(2018,6,24,14)],
  [ "away", "fox sports 1", 2, 4, 6, 1, 2, DateTime.new(2018,8,9,14,15)],
  [ nil, "go90 App", 2, 8, 9, 1, 3, DateTime.new(2018,9,8,19) ],
  [ nil, "Lifetime", 2, 14, 7, 1, 8, DateTime.new(2018,9,8,19)]
]

# matches_list = [
#   [ "home", "Lifetime", 2, 7, 12, 1, 7, "2001-02-04%16:05:06+03:30"],
#   [ "tie", "go90 App", 2, 12, 8, 1, 3, "2001-02-04%16:05:06+03:30"],
#   [ "away", "go90 App", 2, 13, 10, 1, 5, "2001-02-04%16:05:06+03:30"],
#   [ "home", "Lifetime", 2, 9, 11, 1, 3, "2001-02-04%16:05:06+03:30"],
#   [ "away", "fox sports 1", 2, 4, 6, 1, 2, "2001-02-04%16:05:06+03:30"],
#   [ nil, "go90 App", 2, 8, 9, 1, 3, "2001-02-04%16:05:06+03:30" ],
#   [ nil, "Lifetime", 2, 14, 7, 1, 8, "2001-02-04%16:05:06+03:30"]
# ]

matches_list.each do |match|
  Match.create!(result: match[0], channel: match[1], league_id: match[2], away_team_id: match[3], home_team_id: match[4], sport_id: match[5], venue_id: match[6], start: match[7])
end

# [ "name", "username", "twitter_handle", "street_address", "city", "state", "zipcode", "country", "level", "stripeToken", "email", encrypted_password ],
users_list = [
  ["Ethan Fertsch", "efertsch", "@ethanlovesdogs",  "2 Salem Green", "Salem", "MA", "01970","Eastern Time (US & Canada)", "USA", "ethan@mail.com", "password"],
  ["Angie Dale", "adale91", "@angielovesdogs", "865 Franklin St", "Melrose", "MA", "02176", "Eastern Time (US & Canada)",  "USA", "angie@mail.com", "password"],
  ["Denise Duffy", "female inventor", "@denise_duffy", "142 Whitney Street", "San Francisco", "CA",  "94131", "Pacific Time (US & Canada)", "USA", "denise@deniseduffy.com", "password-1"],
  ["Mike Duffy", "big bro", "@hao_cleats", "2700 Great Highway", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA", "mike.duffy@usa.com", "password-2"]
]

# this is not turning the color i want
users_list.each do |user|
  User.create!(name: user[0], username: user[1], twitter_handle: user[2], street_address: user[3], city: user[4], state: user[5], zipcode: user[6], time_zone: user[7], country: user[8], email: user[9], password: user[10])
end


predictions_list = [
  [ "home", "home field advantage", true, 3, 2, 1],
  [ "away", "Sky blue is faster", false, 10, 3, 2],
  [ "tie", "equally matched and a bunch of other things", false, 6, 4, 2],
  [ "home", "more skilled", false, 5, 1, 3],
  [ "away", "they are clicking on all levels", true, 8, 2, 4]
]

predictions_list.each do |prediction|
  Prediction.create!(guess: prediction[0], reason: prediction[1], correct?: prediction[2], likes: prediction[3], user_id: prediction[4], match_id: prediction[5])
end

# Issues:
# encrypted_password => password as specified in devise docs
# added 'optional: true' to belongs_to associations
# had to drop database because even though all records are destroyed the ids continue to be reserved. (Did not match up)
# Had to remove 'remove email from users' migration
# Small issues where certain foreign keys werent present (i.e. predictions list where user 5 made the predicition but we only had 4...)
