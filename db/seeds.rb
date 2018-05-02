# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
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
  t.save
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
  Sport.create(name: sport[0], image_url: sport[1])
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
  [ "Women's Tennis Association (USA)", "WTA", 5],
  [ "Canadian Women's Hockey League (USA)", "CWHL", 4]
]

league_list.each do |league|
  League.create(name: league[0], abbreviation: league[1], sport_id: league[2])
end

venues_list = [
  [ "Toyota Park", "/../assets/images/venues/Toyota_Park.jpg", "7000 Harlem Ave, Bridgeview, IL 60455", "America/Chicago"],
  [ "BBVA Compass Stadium", "/../assets/images/venues/BBVA_Compass.jpg", "2200 Texas St, Houston, TX 77003", "America/Chicago"],
  [ "WakeMed Soccer Park", "/../assets/images/venues/Wake_Med.jpg", "201 Soccer Park Dr, Cary, NC 27511", "America/New_York"],
  [ "Orlando City Stadium", "/../assets/images/venues/Orlando.jpg", "655 W Church St, Orlando, FL 32805", "America/New_York"],
  [ "Providence Park", "/../assets/images/venues/Providence_Park.png", "1844 SW Morrison St, Portland, OR 97205","America/Los_Angeles"],
  [ "Memorial Stadium", "/../assets/images/venues/Memorial_Stadium.jpg", "401 5th Ave N, Seattle, WA 98109", "America/Los_Angeles"],
  [ "Yurcak Field", "/../assets/images/venues/Yurcak_Field.jpg", "83 Fitch Rd, Piscataway Township, NJ 08854", "America/New_York"],
  [ "Rio Tinto Stadium", "/../assets/images/venues/Rio_Tinto_Stadium.jpeg", "9256 State St, Sandy, UT 84070", "America/Denver"],
  [ "Maryland SoccerPlex", "/../assets/images/venues/Maryland_Soccerplex.jpeg", "18031 Central Park Cir, Boyds, MD 20841", "America/New_York"],
  [ "Audi Field", "/../assets/images/venues/Audi_Field.jpg", "32-60 R St SW, Washington, DC 20024", "America/New_York"],
  [ "Avaya Stadium", "/../assets/images/venues/Avaya_Stadium.png", "1123 Coleman Ave, San Jose, CA 95110","America/Los_Angeles"],
  [ "EverBank Field", "/../assets/images/venues/Everbank_Field.jpg", "1 Everbank Field Dr, Jacksonville, FL 32202", "America/New_York"],
  [ "Talen Energy Stadium", "/../assets/images/venues/Talen_Energy_Stadium.jpg", "1 Stadium Dr, Chester, PA 19013", "America/New_York"],
  [ "FirstEnergy Stadium", "/../assets/images/venues/FirstEnergy_Stadium.jpg", "100 Alfred Lerner Way, Cleveland, OH 44114", "America/Chicago"],
  [ "Stade Guy-Piriou", "/../assets/images/venues/Stade_Guy-Pirious.jpg", "13 Rue de Keriolet, 29900 Concarneau", "Europe/Paris"]
]


venues_list.each do |venue|
  Venue.create(name: venue[0], picture_url: venue[1], address: venue[2], timezone: venue[3])
end



# should home, away, or tie be numbers?
# [ "result", "channel", "date", "time", "league_id", "away_team_id", "home_team_id", "sport_id", "venue_id" ],
matches_list = [
  [ "home", "Lifetime", "MAR 24 2018", '12:15:00', 2, 7, 12, 1, 7 ],
  [ "tie", "go90 App", "MAR 24 2018", '12:00:00', 2, 12, 8, 1, 3 ],
  [ "away", "go90 App", "MAR 24 2018", '12:00:00', 2, 13, 10, 1, 5 ],
  [ "home", "Lifetime", "JUNE 24 2018", '14:00:00', 2, 9, 11, 1, 3 ],
  [ "away", "fox sports 1", "AUG 9 2018", '14:15:00', 2, 4, 6, 1, 2 ],
  [ nil, "go90 App", "SEP 8 2018", '19:00:00', 2, 8, 9, 1, 3 ],
  [ nil, "Lifetime", "SEP 8 2018", '19:00:00', 2, 14, 7, 1, 8 ]
]


matches_list.each do |match|
  Match.create(result: match[0], channel: match[1], date: match[2], time: match[3], league_id: match[4], away_team_id: match[5], home_team_id: match[6], sport_id: match[7], venue_id: match[8] )
end


predictions_list = [
  [ "home", "home field advantage", true, 3, 2, 1],
  [ "away", "Sky blue is faster", false, 10, 3, 2],
  [ "tie", "equally matched and a bunch of other things", false, 6, 4, 2],
  [ "home", "more skilled", false, 5, 1, 3],
  [ "away", "they are clicking on all levels", true, 8, 5, 4]
]

predictions_list.each do |prediction|
  Prediction.create(guess: prediction[0], reason: prediction[1], correct?: prediction[2], likes: prediction[3], user_id: prediction[4], match_id: prediction[5])
end


# [ "name", "email", "username", "twitter_handle", "street_address", "city", "state", "zipcode", "country", "level", "stripeToken", "encrypted_password", "sign_in_count" ],
users_list = [
  ["Ethan Fertsch", "ethan@mail.com", "efertsch", "@ethanlovesdogs", "2 Salem Green", "Salem", "MA", "01970", "USA", "admin", nil, "password"],
  ["Angie Dale", "angie@mail.com", "adale91", "@angielovesdogs", "865 Franklin St", "Melrose", "MA", "02176", "USA", "user", nil, "password"],
  ["Denise Duffy", "denise@deniseduffy.com", "female inventor", "@denise_duffy", "142 Whitney Street", "San Francisco", "USA", "CA",  "94131", "admin", "BQokikJOvBiI2HlWgH4olfQ2", "password-1", 50],
  ["Mike Duffy", "mike.duffy@usa.com", "big bro", "@hao_cleats", "2700 Great Highway", "San Francisco", "CA", "96161", "USA", "user", "BQokikJOvBiI2HlWgH4olfQ3", "password-2", 2]
]

# this is not turning the color i want
users_list.each do |user|
  User.create(name: user[0], email: user[1], username: user[2], twitter_handle: user[3], street_address: user[4], city: user[5], state: user[6], zipcode: user[7], country: user[8], level: user[9], stripeToken: user[10], encrypted_password: user[11])
end
