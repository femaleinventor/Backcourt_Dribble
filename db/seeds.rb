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
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BCD_for_CSV_teams_062218.csv'))
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


venues_list = [
  #id 1
  [ "Toyota Park", "venues/Toyota_Park.jpg", "7000 Harlem Ave, Bridgeview, IL 60455", "America/Chicago"],
  #id 2
  [ "BBVA Compass Stadium", "venues/BBVA_Compass.jpg", "2200 Texas St, Houston, TX 77003", "America/Chicago"],
  #id 3
  [ "WakeMed Soccer Park", "venues/Wake_Med.jpg", "201 Soccer Park Dr, Cary, NC 27511", "America/New_York"],
  #id 4
  [ "Orlando City Stadium", "venues/Orlando.jpg", "655 W Church St, Orlando, FL 32805", "America/New_York"],
  #id 5
  [ "Providence Park", "venues/Providence_Park.png", "1844 SW Morrison St, Portland, OR 97205","America/Los_Angeles"],
  #id 6
  [ "Memorial Stadium", "venues/Memorial_Stadium.jpg", "401 5th Ave N, Seattle, WA 98109", "America/Los_Angeles"],
  #id 7
  [ "Yurcak Field", "venues/Yurcak_Field.jpg", "83 Fitch Rd, Piscataway Township, NJ 08854", "America/New_York"],
  #id 8
  [ "Rio Tinto Stadium", "venues/Rio_Tinto_Stadium.jpeg", "9256 State St, Sandy, UT 84070", "America/Denver"],
  #id 9
  [ "Maryland SoccerPlex", "venues/Maryland_Soccerplex.jpeg", "18031 Central Park Cir, Boyds, MD 20841", "America/New_York"],
  #id 10
  [ "Audi Field", "venues/Audi_Field.jpg", "32-60 R St SW, Washington, DC 20024", "America/New_York"],
  #id 11
  [ "Avaya Stadium", "venues/Avaya_Stadium.png", "1123 Coleman Ave, San Jose, CA 95110","America/Los_Angeles"],
  #id 12
  [ "EverBank Field", "venues/Everbank_Field.jpg", "1 Everbank Field Dr, Jacksonville, FL 32202", "America/New_York"],
  #id 13
  [ "Talen Energy Stadium", "venues/Talen_Energy_Stadium.jpg", "1 Stadium Dr, Chester, PA 19013", "America/New_York"],
  #id 14
  [ "FirstEnergy Stadium", "venues/FirstEnergy_Stadium.jpg", "100 Alfred Lerner Way, Cleveland, OH 44114", "America/Chicago"],
  #id 15
  [ "Stade Guy-Piriou", "venues/Stade_Guy-Pirious.jpg", "13 Rue de Keriolet, 29900 Concarneau", "Europe/Paris"],
  #id 16
  [ "Children’s Mercy Park", "venues/Childrens_Mercy_Park.png", "1 Sporting Way, Kansas City, KS 66111 Kansas City", "America/Chicago"],
  #id 17
  [ "Pratt & Whitney Stadium at Rentschler Field", "venues/Pratt_and_Whitney_Stadium.jpg", "615 Silver Ln, East Hartford, CT 06118", "America/New_York"],
  #id 18
  [ "StubHub Center", "venues/StubHub_Center.jpg", "18400 S Avalon Blvd, Carson, CA 90746", "America/Los_Angeles"],
  #id 19
  [ "Hard Rock Stadium", "venues/hard_rock_stadium.jpg", "347 Don Shula Dr, Miami Gardens, FL 33056", "America/New_York"]
]


venues_list.each do |venue|
  Venue.create!(name: venue[0], picture_url: venue[1], address: venue[2], timezone: venue[3])
end

# 6 Chicago Redstars
# 7 Houston Dash
# 8 North Carolina Courage
# 9 Orlando Pride
# 10 Portland Thorns
# 11 Seattle Reign
# 12 Sky Blue FC
# 13 Utah Royals
# 14 Washington Spirit
# 15 NWSL Retired Players
# 16 USWNT Soccer
# 17 USWNT Soccer U-23
# 18 USWNT Soccer U-20
# 19 USWNT Soccer U-19




# [ "result", "channel", "league_id", "away_team_id", "home_team_id", "sport_id", "venue_id", "start" ],
matches_list = [
  #id 1
  # courage vs portland
  [ "North Carolina Courage", "Lifetime", 2, 10, 8, 1, 3, DateTime.new(2018,3,24,12,15)],
  #id 2
  # pride vs Royals
  [ "tie", "go90 App", 2, 13, 9, 1, 4, DateTime.new(2018,3,24,12)],
  #id 3
  # reign vs spirit
  [ "Seattle Reign", "go90 App", 2, 14, 11, 1, 6, DateTime.new(2018,3,24,12)],
  #id 4
  # dash vs redstars
  [ "tie", "go90 App", 2, 6, 7, 1, 2, DateTime.new(2018,3,24,12)],
  #id 5
  # dash vs royals
  [ "tie", "go90 App", 2, 13, 7, 1, 2, DateTime.new(2018,3,30,15)],
  #id 6
  # courage vs sky blue
  [ "North Carolina Courage", "go90 App", 2, 8, 9, 1, 3, DateTime.new(2018,9,8,19)],
  #id 7
  # washington vs pride
  [ "Washington Spirit", "Lifetime", 2, 9, 14, 1, 9, DateTime.new(2018,9,8,19)],
  #id 8
  # Dash vs Thorns
  [ nil, "go90 App", 2, 10, 7, 1, 2, DateTime.new(2018,6,22,17,30)],
  #id 9
  # Reign vs Courage
  [ nil, "go90 App", 2, 8, 11, 1, 6, DateTime.new(2018,6,23,13)],
  #id 10
  # Spirit vs Pride
  [ nil, "ESPN News", 2, 9, 14, 1, 9, DateTime.new(2018,6,23,19)],
  #id 11
  # Redstars vs Royals
  [ nil, "go90 App", 2, 13, 6, 1, 1, DateTime.new(2018,6,23,19)],
  #id 12
  # Pride vs Dash
  [ nil, "go90 App", 2, 7, 9, 1, 4, DateTime.new(2018,6,23,15,30)],
  #id 13
  # Royals vs Seattle 6/27
  [ nil, "go90 App", 2, 7, 9, 1, 4, DateTime.new(2018,6,23,15,30)],

  # Coming up after hackathon games
  #id 14
  # sky blue vs Courage
  [ nil, "go90 App", 2, 8, 12, 1, 7, DateTime.new(2018,7,14,19)],
  #id 15
  # royals vs pride
  [ nil, "ESPN News", 2, 9, 13, 1, 8, DateTime.new(2018,7,14,17)],
  #id 16
  # redstars vs Reign
  [ nil, "go90 App", 2, 11, 6, 1, 1, DateTime.new(2018,7,14,19)],
  #id 17
  # thorns vs dash
  [ nil, "go90 App", 2, 7, 10, 1, 5, DateTime.new(2018,7,15,19)],
  #id 18
  # royals vs Courage
  [ nil, "go90 App", 2, 8, 13, 1, 8, DateTime.new(2018,7,20,20)],
  #id 19
  # pride vs Reign
  [ nil, "Lifetime", 2, 11, 9, 1, 6, DateTime.new(2018,7,21,15,30)],
  #id 20
  # spirit vs dash
  [ nil, "go90 App", 2, 7, 14, 1, 2, DateTime.new(2018,7,21,19)],
  #id 21
  # sky blue vs thorns
  [ nil, "go90 App", 2, 10, 12, 1, 5, DateTime.new(2018,7,21,19)],
  #id 22
  # redstars vs sky blue
  [ nil, "go90 App", 2, 12, 6, 1, 7, DateTime.new(2018,7,28,19)],
  #id 23
  # courage vs Thorns 8/5
  [ nil, "go90 App", 2, 10, 8, 1, 3, DateTime.new(2018,8,05,20)],
  #id 24
  # pride vs SKY
  [ nil, "go90 App", 2, 12, 9, 1, 4, DateTime.new(2018,8,05,19,30)],
  #id 25
  # dash vs Royals
  [ nil, "go90 App", 2, 13, 7, 1, 2, DateTime.new(2018,8,05,19)],
  #id 26
  # reign vs spirit
  [ nil, "go90 App", 2, 11, 14, 1, 6, DateTime.new(2018,8,05,19)],
  #id 27
  # USA vs Japan
  [ nil, "FS1", 1, 41, 16, 1, 16, DateTime.new(2018,7,23,18)],
  #id 28
  # USA vs Australia
  [ nil, "FS1", 1, 43, 16, 1, 17, DateTime.new(2018,7,29,19)],
  #id 29
  # USA vs Brazil
  [ nil, "FS1", 1, 44, 16, 1, 1, DateTime.new(2018,8,02,19,30)],
  #id 30
  # USA vs Chile
  [ nil, "ESPN2", 1, 45, 16, 1, 18, DateTime.new(2018,8,31,20)],
  #id 31
  # USA vs Chile
  [ nil, "ESPN2", 1, 45, 16, 1, 19, DateTime.new(2018,7,29,19)],
]

matches_list.each do |match|
  Match.create!(result: match[0], channel: match[1], league_id: match[2], away_team_id: match[3], home_team_id: match[4], sport_id: match[5], venue_id: match[6], start: match[7])
end

# [ "name", "username", "twitter_handle", "street_address", "city", "state", "zipcode", "country", "level", "stripeToken", "email", encrypted_password ],
users_list = [
  #id1
  ["Ethan Fertsch", "efertsch", "@ethanlovesdogs",  "2 Salem Green", "Salem", "MA", "01970","Eastern Time (US & Canada)", "USA", "ethan@mail.com", "password"],
  #id2
  ["Angie Dale", "adale91", "@angielovesdogs", "865 Franklin St", "Melrose", "MA", "02176", "Eastern Time (US & Canada)",  "USA", "angie@mail.com", "password"],
  #id3
  ["Denise Duffy", "sunnysideup", "@denise_duffy", "142 Whitney Street", "San Francisco", "CA",  "94131", "Pacific Time (US & Canada)", "USA", "denise@deniseduffy.com", "password"],
  #id4
  ["Mike Duffy", "big bro", "@hao_cleats", "2700 Great Highway", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA", "mike.duffy@usa.com", "password"],
  #id5
  ["Big Pappy", "notDanLauletta", "@bigboy", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notdan@usa.com", "password"],
  #id6
  ["Tom Tom", "tom tom", "@wosoboy", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","danny@usa.com", "password"],
  #id7
  ["Sue Bright", "susan14", "@wosogirl", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notsusan@usa.com", "password"],
  #id8
  ["Tim Tim", "defnotJohnHalloran", "@josoboy", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notjohn@usa.com", "password"],
  #id9
  ["Sue Sue", "ballergirl", "@ballergirl", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","ballergirl@usa.com", "password"],
]

# this is not turning the color i want
users_list.each do |user|
  User.create!(name: user[0], username: user[1], twitter_handle: user[2], street_address: user[3], city: user[4], state: user[5], zipcode: user[6], time_zone: user[7], country: user[8], email: user[9], password: user[10])
end


predictions_list = [
  # guess: prediction[0], reason: prediction[1], correct?: prediction[2], likes: prediction[3], user_id: prediction[4], match_id: prediction[5]

  #id 1
  # courage vs portland
  [ "North Carolina Courage", "Parsons is going to get Pauwed", true, 8, 2, 1],
  [ "North Carolina Courage", "Horan can't carry the full team", true, 3, 3, 1],
  [ "Portland Thorns", "Thorns are finally flowing", false, 1, 5, 1],
  [ "Portland Thorns", "Thorns have too much Talent", false, 2, 4, 1],
  #id 2
  # pride vs Royals
  [ "Orland Pride", "The pride has all the pieces", nil, 8, 2, 2],
  [ "Orland Pride", "Pride has Marta. She's the biggest generator in the world", nil, 3, 3, 2],
  [ "Utah Royals", "Laura Harvey will make the ball go in the net with her eyes", nil, 1, 1, 2],
  [ "Utah Royals", "They have the best defense in the league by far", nil, 2, 1, 2],
  #id 3
  # reign vs spirit
  [ "Seattle Reign", "Vlatko ", nil, 8, 2, 3],
  [ "Seattle Reign", "Horan won't be there", nil, 3, 3, 3],
  [ "Washington Spirit", "Thorns are finally flowing", nil, 1, 1, 3],
  [ "Washington Spirit", "Thorns have too much Talent", nil, 2, 1, 3],
  #id 4
  # dash vs redstars
  [ "Houston Dash", "Parsons is going to get Pauwed", nil, 8, 2, 4],
  [ "Houston Dash", "Horan won't be there", nil, 3, 3, 4],
  [ "Chicago Redstars", "Thorns are finally flowing", nil, 1, 1, 4],
  [ "Chicago Redstars", "Thorns have too much Talent", nil, 2, 1, 4],
  #id 5
  # dash vs royals
  [ "Houston Dash", "Parsons is going to get Pauwed", nil, 8, 2, 5],
  [ "Houston Dash", "Horan won't be there", nil, 3, 3, 5],
  [ "tie", "Thorns are finally flowing", nil, 1, 1, 5],
  [ "Utah Royals", "Thorns have too much Talent", nil, 2, 1, 5],
  #id 6
  # courage vs sky blue
  [ "North Carolina Courage", "Parsons is going to get Pauwed", nil, 8, 2, 6],
  [ "North Carolina Courage", "Horan won't be there", nil, 3, 3, 6],
  [ "Sky Blue FC", "Thorns are finally flowing", nil, 1, 1, 6],
  [ "Sky Blue FC", "Thorns have too much Talent", nil, 2, 1, 6],
  #id 7
  # washington vs pride
  [ "Washington spirit", "Parsons is going to get Pauwed", nil, 8, 2, 7],
  [ "Washington spirit", "Horan won't be there", nil, 3, 3, 7],
  [ "Orlando Pride", "Thorns are finally flowing", nil, 1, 1, 7],
  [ "Orlando Pride", "Thorns have too much Talent", nil, 2, 1, 7],
  # id 8
  # Dash vs Thorns
  [ "Houston Dash", "Parsons is going to get Pauwed", nil, 8, 2, 8],
  [ "Houston Dash", "Horan won't be there", nil, 3, 3, 8],
  [ "tie", "They are evenly matched without the great Horan", nil, 1, 1, 8],
  [ "Portland Thorns", "Thorns have too much Talent", nil, 2, 1, 8],
  #id 9
  # # Reign vs Courage
  # [ "tie", "As the season goes on these teams are evenly matched", nil, 2, 1, 9],
  # [ "away", "Courage on penalty kicks are just so tall, the ball will go over the defense", nil, 2, 2, 9],
  # [ "home", "Seattle will give us a perfect storm", nil, 2, 8, 9],
  # [ "tie", "It will be a good game, but no winners though", nil, 2, 4, 9],
  # #id 10
  # # Spirit vs Pride
  # [ "tie", "Too close to call", nil, 2, 5, 10],
  # [ "home", "Seatlle has tons of soccer IQ", nil, 2, 8, 10],
  # [ "away", "Pride have more scoring talent", nil, 2, 1, 10],
  # [ "away", "Pride's defense has improved", nil, 2, 2, 10],
  # #id 11
  # # Redstars vs Royals
  # [ "tie", "Too close to call", nil, 2, 1, 11],
  # [ "home", "Redstars have Sam Kerr", nil, 2, 8, 11],
  # [ "away", "Royals have Press", nil, 2, 8, 11],
  # [ "away", "Laura Harvey really knows how to coach", nil, 2, 5, 11],
  # #id 12
  # # Pride vs Dash
  # [ "tie", "They both will score 1 goal", nil, 2, 1, 12],
  # [ "home", "Krieger fever will take over", nil, 2, 8, 12],
  # [ "away", "The Dash will surprise us", nil, 2, 8, 12],
  # [ "away", "Pauw really knows how to coach", nil, 2, 5, 12],
  # #id 13
  # # Royals vs Seattle 6/27
  # [ "tie", "Royals have amazing defense, 0-0 tie", nil, 2, 1, 13],
  # [ "home", "Press will get one or two", nil, 2, 8, 13],
  # [ "home", "The Royals are just gelling", nil, 2, 8, 13],
  # [ "away", "Seattle knows what they are doing", nil, 2, 5, 13],


  # Coming up after hackathon games
  #id 14
  # sky blue vs Courage

  #id 15
  # royals vs pride

  #id 16
  # redstars vs Reign

  #id 17
  # thorns vs dash

  #id 18
  # royals vs Courage

  #id 19
  # pride vs Reign

  #id 20
  # spirit vs dash

  #id 21
  # sky blue vs thorns

  #id 22
  # redstars vs sky blue

  #id 23
  # courage vs Thorns 8/5

  #id 24
  # pride vs SKY

  #id 25
  # dash vs Royals

  #id 26
  # reign vs spirit

  #id 27
  # USA vs Japan

  #id 28
  # USA vs Australia

  #id 29
  # USA vs Brazil

  #id 30
  # USA vs Chile

  #id 31
  # USA vs Chile

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
