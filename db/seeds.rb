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
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BCD_for_CSV_teams_062518.csv'))
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
  [ "International Champions Cup", "ICC", 1],
  [ "Liga MX Femenil (Mexico)", "Liga MX", 1],
  [ "UEFA Women's Champions League Champion's League (Europe)", 1 ],
  [ "Allianz Frauen-Bundesliga (Germany)", "Frauen-Bundesliga", 1],
  [ "FA Women's Super League (England)", "FA Super League", 1],
  [ "FA Women's Championship League (England)", "FA Championship", 1],
  [ "FA Women's National League (England)", "FA National", 1],
  [ "Westfield W-League (Australia)", "W-League", 1],
  [ "National Women’s League (New Zealand)", "NWL", 1 ],
  [ "Primera División Femenina (Spain)", "Primera División", 1],
  [ "Serie A Women (Italy)", "Serie A", 1],
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
  Venue.create!(name: venue[0], picture_url: venue[1], address: venue[2], time_zone: venue[3])
end






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
  # courage vs dash
  [ nil, "NSWL App", 2, 7, 8, 1, 3, DateTime.new(2018,9,8,16)],
  #id 7
  # sky vs pride
  [ nil, "NSWL App", 2, 9, 12, 1, 7, DateTime.new(2018,9,8,9)],
  #id 8
  # Dash vs Thorns
  [ "Portland Thorns", "go90 App", 2, 10, 7, 1, 2, DateTime.new(2018,6,22,17,30)],
  #id 9
  # Reign vs Courage
  [ "North Carolina Courage", "go90 App", 2, 8, 11, 1, 6, DateTime.new(2018,6,23,13)],
  #id 10
  # Spirit vs Pride
  [ "Orland Pride", "ESPN News", 2, 9, 14, 1, 9, DateTime.new(2018,6,23,19)],
  #id 11
  # Redstars vs Royals
  [ "Chicago Redstars", "go90 App", 2, 13, 6, 1, 1, DateTime.new(2018,6,23,19)],
  #id 12
  # Pride vs Dash
  [ "Houston Dash", "go90 App", 2, 7, 9, 1, 4, DateTime.new(2018,6,27,15,30)],
  #id 13
  # Royals vs Seattle 6/27
  [ "tie", "go90 App", 2, 11, 13, 1, 4, DateTime.new(2018,6,27,15,30)],
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
  [ nil, "ESPN2", 1, 45, 16, 1, 11, DateTime.new(2018,9,4,19)],
  # 32
  # Courage vs PSG
  [ nil, "ESPN2", 3, 47, 8, 1, 19, DateTime.new(2018,7,26,18,15)],
  # 33
  # Lyon vs Man City
  [ nil, "ESPN2", 3, 48, 46, 1, 19, DateTime.new(2018,7,26,21)],
  #34
  # royals vs red stars
  [ nil, "NWSL App", 2, 6, 13, 1, 8, DateTime.new(2018,9,8,12,30)],
  #35
  # thorns vs reign
  [ nil, "NWSL App", 2, 11, 10, 1, 5, DateTime.new(2018,9,7,19)],
  #36
  # wash vs sky blue
  [ nil, "NWSL App", 2, 12, 14, 1, 9, DateTime.new(2018,9,1,16)],
  #37
  # seattle reign vs north carolina
  [ nil, "NWSL App", 2, 8, 11, 1, 6, DateTime.new(2018,8,25,13)],
  #38
  # pride vs redstars
  [ nil, "NWSL App", 2, 6, 9, 1, 4, DateTime.new(2018,8,25,16,30)],
  #39
  # spirit vs thorns
  [ nil, "NWSL App", 2, 10, 14, 1, 10, DateTime.new(2018,8,25,17)],
  #40
  # dash vs sky
  [ nil, "NWSL App", 2, 12, 7, 1, 2, DateTime.new(2018,8,25,17,30)],
  #41
  # thorns vs sky
  [ nil, "NWSL App", 2, 12, 10, 1, 5, DateTime.new(2018,8,22,20)],
  #42
  # spirit vs royals
  [ nil, "NWSL App", 2, 13, 14, 1, 9, DateTime.new(2018,8,22,16,30)],
  #43
  # reign vs dash
  [ nil, "NWSL App", 2, 7, 11, 1, 6, DateTime.new(2018,8,21,19,30)]
]

matches_list.each do |match|
  Match.create!(result: match[0], channel: match[1], league_id: match[2], away_team_id: match[3], home_team_id: match[4], sport_id: match[5], venue_id: match[6], start: match[7])
end

# [ "name", "username", "twitter_handle", "street_address", "city", "state", "zipcode", "country", "level", "stripeToken", "email", encrypted_password, avatar ],
users_list = [

  #id1
  ["Denise Duffy", "sunnysideup", "@denise_duffy", "142 Whitney Street", "San Francisco", "CA",  "94131", "Pacific Time (US & Canada)", "USA", "denise@deniseduffy.com", "password", "bitmoji/denise.jpeg", true],
  #id2
  ["Ethan Fertsch", "software engineer", nil,  "2 Salem Green", "Salem", "MA", "01970","Eastern Time (US & Canada)", "USA", "efertsch@gmail.com", "password", "bitmoji/erica.jpeg", true],
  #id2
  # ["Heather Yeager", "oceanlvr", "@oceanlvr328", "865 Franklin St", "Melrose", "MA", "02176", "Eastern Time (US & Canada)",  "USA", "angie@mail.com", "password", "bitmoji/heather.jpeg", false],
  # #id4
  # ["Tania Ardel", "sunnysideup", "@ardelltania", "2700 Great Highway", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA", "mike.duffy@usa.com", "password", "bitmoji/tania.jpeg", false],
  # #id5
  # ["Rachel W", "Rachel_Will!", "@rachelwill", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notdan@usa.com", "password", "bitmoji/rachel.jpeg", false],
  # #id6
  # ["Butch Loy", "sportyinmiami", "@HMLoy86", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","danny@usa.com", "password", "bitmoji/butch.jpeg", false],
  # #id7
  # ["Lura McCoy", "luramccoy81", "@wosogirl", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notsusan@usa.com", "password", "bitmoji/laura.jpeg", false],
  # #id8
  # ["Alice Keeney", "navy_vet", "@alicesauce", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","notjohn@usa.com", "password", "bitmoji/alice.jpeg", false],
  # #id9
  # ["Hannah Basso", "ballergirl", "@bassohannah", "111 A Street", "San Francisco", "CA", "96161", "Pacific Time (US & Canada)", "USA","ballergirl@usa.com", "password", "bitmoji/hannah.jpeg", false]
]

# this is not turning the color i want
users_list.each do |user|
  User.create!(name: user[0], username: user[1], twitter_handle: user[2], street_address: user[3], city: user[4], state: user[5], zipcode: user[6], time_zone: user[7], country: user[8], email: user[9], password: user[10], avatar: user[11], admin: user[12])
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

predictions_list = [
  # guess: prediction[0], reason: prediction[1], correct?: prediction[2], likes: prediction[3], user_id: prediction[4], match_id: prediction[5]

  #id 1
  # courage vs portland
  # [ "North Carolina Courage", "Parsons is going to get Pauwed", true, 8, 2, 1],
  # [ "North Carolina Courage", "Horan can't carry the full team", true, 3, 8, 1],
  # [ "Portland Thorns", "Thorns are finally flowing", false, 1, 5, 1],
  # [ "Portland Thorns", "Thorns have too much Talent", false, 2, 4, 1],
  # #id 2
  # # pride vs Royals
  # [ "Tie", "The pride has all the pieces but can't quite put them together", true, 8, 2, 2],
  # [ "Orland Pride", "Pride has Marta. She's the biggest generator in the world", false, 3, 3, 2],
  # [ "Utah Royals", "Laura Harvey will make the ball go in the net with her eyes", false, 1, 1, 2],
  # [ "Utah Royals", "They have the best defense in the league by far", false, 2, 5, 2],
  # #id 3
  # # reign vs spirit
  # [ "Seattle Reign", "Vlatko ", true, 8, 2, 3],
  # [ "Seattle Reign", "It will Reign down on them", true, 3, 1, 3],
  # [ "Washington Spirit", "Sullivan and Pugh will finally get it going", false, 1, 6, 3],
  # [ "Washington Spirit", "JoLo will do something creative", false, 2, 7, 3],
  # #id 4
  # # dash vs redstars
  # [ "Houston Dash", "Parsons is going to get Pauwed", false, 8, 8, 4],
  # [ "Houston Dash", "Back line will hold", false, 3, 3, 4],
  # [ "Chicago Redstars", "Midfield is da bomb", false, 16, 1, 4],
  # [ "Tie", "SAM KERR is not here yet", true, 2, 1, 4],
  # #id 5
  # # dash vs royals
  # [ "Houston Dash", "They are getting better", false, 8, 2, 5],
  # [ "Houston Dash", "South Africans are clicking", false, 3, 5, 5],
  # [ "Tie", "Um, nobody will winn", true, 1, 6, 5],
  # [ "Utah Royals", "Better coached", false, 2, 7, 5],
  # #id 6
  # # courage vs sky blue
  # [ "North Carolina Courage", "Twin Towers on fire", true, 8, 8, 6],
  # [ "North Carolina Courage", "Erceg will head one in", true, 3, 3, 6],
  # [ "Sky Blue FC", "They might get lucky", false, 1, 1, 6],
  # [ "Sky Blue FC", "Praying and hoping they get some points", false, 2, 2, 6],
  # #id 7
  # # washington vs pride
  # [ "Washington Spirit", "JoLo will rock it", true, 8, 4, 7],
  # [ "Washington Spirit", "Best fans", true, 3, 3, 7],
  # [ "Orlando Pride", "Harris is the new wall", false, 1, 5, 7],
  # [ "Orlando Pride", "I have Krieger fever", false, 2, 6, 7],
  # # id 8
  # # Dash vs Thorns
  # [ "Houston Dash", "Parsons is going to get Pauwed", false, 8, 7, 8],
  # [ "Houston Dash", "Horan won't be there", false, 3, 8, 8],
  # [ "Tie", "They are evenly matched without the great Horan", false, 1, 1, 8],
  # [ "Portland Thorns", "Thorns have too much Talent", true, 2, 2, 8],
  #
  # #id 9
  # # Reign vs Courage
  # [ "Seattle Reign", "Rapinoe has so many ideas", false, 2, 3, 9],
  # [ "North Carolina Courage", "Courage on penalty kicks are just so tall, the ball will go over the defense", true, 2, 4, 9],
  # [ "North Carolina Courage", "Seattle will give us a perfect storm but the courage will rock it.", true, 2, 8, 9],
  # [ "Tie", "It will be a good game, but no winners though", false, 2, 5, 9],
  # #id 10
  # # Spirit vs Pride
  # [ "Tie", "Too close to call", false, 2, 5, 10],
  # [ "Washington Spirit", "Mal Pugh will bring it", false, 2, 8, 10],
  # [ "Washington Spirit", "Sullivan will dominate", false, 2, 6, 10],
  # [ "Orlando Pride", "Marta Marta Marta", true, 2, 7, 10],
  # #id 11
  # # Redstars vs Royals
  # [ "Chicago Redstars", "Best goalie in the world", true, 1, 1, 11],
  # [ "Chicago Redstars", "Redstars have Sam Kerr", true, 2, 8, 11],
  # [ "Utah Royals", "Royals have Press", false, 3, 8, 11],
  # [ "Utah Royals", "Laura Harvey really knows how to coach", false, 2, 5, 11],
  # #id 12
  # # Pride vs Dash
  # [ "Tie", "They both will score 1 goal", false, 2, 4, 12],
  # [ "Orlando Pride", "Krieger fever will take over", false, 2, 5, 12],
  # [ "Orlando Pride", "Kennedy will kill it", false, 2, 8, 12],
  # [ "Houston Dash", "Pauw really knows how to coach", true, 2, 7, 12],
  # #id 13
  # # Royals vs Seattle 6/27
  # [ "Tie", "Royals have amazing defense, 0-0 tie", true, 2, 1, 13],
  # [ "Utah Royals", "Press will get one or two", false, 2, 2, 13],
  # [ "Utah Royals", "The Royals are just gelling", false, 2, 3, 13],
  # [ "Seattle Reign", "Seattle knows what they are doing", false, 2, 4, 13],
  #
  # # Coming up after hackathon games
  # #id 14
  # # sky blue vs Courage
  # [ "Tie", "0-0, SBFC will hang on ", nil, 2, 5, 14],
  # [ "North Carolina Courage", "omg, they are so far ahead, doesn't matter if they win or lose, but they will win", nil, 2, 6, 14],
  # [ "North Carolina Courage", "More fit, better mentality", nil, 2, 8, 14],
  # [ "Sky Blue FC", "Going out on a limb here", nil, 2, 7, 14],
  #
  # #id 15
  # # royals vs pride
  # [ "Tie", "Royals have amazing defense, 0-0 tie", nil, 2, 1, 15],
  # [ "Orlando Pride", "They will step up and own the midfield", nil, 2, 8, 15],
  # [ "Orlando Pride", "Harris will make some great saves", nil, 2, 3, 15],
  # [ "Utah Royals", "Rodriguez will just sop up any rebounds and punch them through", nil, 2, 4, 15],
  #
  # #id 16
  # # redstars vs Reign
  # [ "Tie", "predicting a 2-2 tie here", nil, 2, 5, 16],
  # [ "Seattle Reign", "Jess Fishlock is just going to squash them", nil, 2, 8, 16],
  # [ "Seattle Reign", "The Reign are just now getting it together for real.", nil, 2, 6, 16],
  # [ "Chicago Redstars", "Chicago knows what they are doing", nil, 2, 7, 16],
  #
  # #id 17
  # # thorns vs dash
  # [ "Tie", "0-0, they will both play too defensively", nil, 2, 1, 17],
  # [ "Portland Thorns", "Press will get one or two", nil, 2, 8, 17],
  # [ "Portland Thorns", "The Royals are just gelling", nil, 2, 3, 17],
  # [ "Houston Dash", "Seattle knows what they are doing", nil, 2, 5, 17],
  #
  # #id 18
  # # royals vs Courage
  # [ "Tie", "they will both play scared", nil, 2, 4, 18],
  # [ "North Carolina Courage", "Press will get one or two", nil, 2, 5, 18],
  # [ "North Carolina Courage", "The Royals are just gelling", nil, 2, 6, 18],
  # [ "Utah Royals", "Seattle knows what they are doing", nil, 2, 7, 18],
  #
  # #id 19
  # # pride vs Reign
  # [ "Tie", "both are over coached", nil, 2, 1, 19],
  # [ "Orlando Pride", "Press will get one or two", nil, 2, 8, 19],
  # [ "Orlando Pride", "The Royals are just gelling", nil, 2, 2, 19],
  # [ "Seattle Reign", "Seattle knows what they are doing on both sides", nil, 2, 3, 19],
  #
  # #id 20
  # # spirit vs dash
  # [ "Tie", "alot of defense, not alot of offence, 0-0 tie", nil, 2, 4, 20],
  # [ "Washington Spirit", "Pugh will get one or two", nil, 2, 5, 20],
  # [ "Washington Spirit", "Bledsoe is the best goal keeper around", nil, 2, 8, 20],
  # [ "Houston Dash", "They are trying their best and they will dominate this one", nil, 2, 6, 20],
  #
  # #id 21
  # # sky blue vs thorns
  # [ "Tie", "3-3, the scoring will finally begin", nil, 2, 7, 21],
  # [ "Sky Blue FC", "omg, wouldn't it be great if they beat the throns?", nil, 2, 6, 21],
  # [ "Sky Blue FC", "i mean, why not?", nil, 2, 5, 21],
  # [ "Portland Thorns", "Sorry, they will dominate Sky Blue", nil, 2, 4, 21],
  #
  # #id 22
  # # redstars vs sky blue
  # [ "Tie", "Sam Kerr will not score. 0-0 tie", nil, 2, 3, 22],
  # [ "Sky Blue FC", "Sky Blue will be highly motivated", nil, 2, 2, 22],
  # [ "Sky Blue FC", "This one they will really be up for", nil, 2, 1, 22],
  # [ "Chicago Redstars", "Too much offensive power", nil, 2, 8, 22],
  #
  # #id 23
  # # courage vs Thorns 8/5
  # [ "Tie", "they will just detroy each other but it will end up in a tie", nil, 2, 7, 23],
  # [ "North Carolina Courage", "Our outside backs will outrun you", nil, 2, 6, 23],
  # [ "North Carolina Courage", "Zerboni Zerboni Zerboni", nil, 2, 8, 23],
  # [ "Portland Thorns", "Grudge match for sure, we will win", nil, 4, 5, 23],
  #
  # #id 24
  # # pride vs SKY
  # [ "Tie", "Will be a competitive, 1-1 tie", nil, 2, 5, 24],
  # [ "Orlando Pride", "Alex Morgan is the best player in the world", nil, 2, 4, 24],
  # [ "Orlando Pride", "Our backline is getting better", nil, 2, 3, 24],
  # [ "Sky Blue FC", "Finally we have put a backline together", nil, 2, 2, 24],
  #
  # #id 25
  # # dash vs Royals
  # [ "Tie", "Royals have amazing defense, 0-0 tie", nil, 2, 1, 25],
  # [ "Houston Dash", "Racheal Daly will rock it!", nil, 2, 8, 25],
  # [ "Houston Dash", "Huuuuueeeerrrrtaaa! She is so good.", nil, 2, 7, 25],
  # [ "Utah Royals", "Press A-Rod O'Hara, omg, so freaking good", nil, 2, 6, 25],
  #
  # #id 26
  # # reign vs spirit
  # [ "Tie", "Meh, i think they are even", nil, 2, 5, 26],
  # [ "Washington Spirit", "pugh vs rapinoe, i'm going with Pugh", nil, 2, 4, 26],
  # [ "Washington Spirit", "The Spirit are just gelling", nil, 2, 8, 26],
  # [ "Seattle Reign", "Seattle knows what they are doing", nil, 2, 3, 26],
  #
  # #id 27
  # # USA vs Japan
  # [ "Tie", "both teams won't break each other's defense, 0-0 tie", nil, 2, 1, 27],
  # [ "Japan National Football", "Master class in possession", nil, 2, 2, 27],
  # [ "Japan National Football", "They will patiently find the right counter", nil, 2, 8, 27],
  # [ "USWNT Soccer", "We are just so transitionally fast", nil, 2, 1, 27],
  #
  # #id 28
  # # USA vs Australia
  # [ "Tie", "4-4 It will be a wild scoring affair", nil, 2, 1, 28],
  # [ "USWNT Soccer", "We will not let last year happen again.", nil, 2, 8, 28],
  # [ "USWNT Soccer", "We have the best front line and back line, working on the middle but we will still win", nil, 2, 8, 28],
  # [ "Australia", "Hottest team in the world right now", nil, 2, 5, 28],
  #
  # #id 29
  # # USA vs Brazil
  # [ "Tie", "I just think it will be even in the scoring even though US will still dominate", nil, 2, 1, 29],
  # [ "USWNT Soccer", "Press will get one or two", nil, 2, 8, 29],
  # [ "USWNT Soccer", "Our midfield will finally come together", nil, 2, 8, 29],
  # [ "Brazil", "Marta will just find a way to score more than USA", nil, 2, 5, 29],
  #
  # #id 30
  # # USA vs Chile
  # [ "Tie", "Royals have amazing defense, 0-0 tie", nil, 2, 1, 30],
  # [ "USWNT Soccer", "Press will get one or two", nil, 2, 8, 30],
  # [ "USWNT Soccer", "The Royals are just gelling", nil, 2, 8, 30],
  # [ "Chile", "Seattle knows what they are doing", nil, 2, 5, 30],
  #
  # #id 31
  # # USA vs Chile
  # [ "Tie", "USA will be trying too many things out and Chile will just go for it.", nil, 2, 1, 31],
  # [ "Chile", "They will steal this one.", nil, 2, 8, 31],
  # [ "USWNT Soccer", "Dunn will find the back of the net", nil, 2, 8, 31],
  # [ "USWNT Soccer", "Our long range passing will just find a way", nil, 2, 5, 31],
  #
  # # 32
  # # Courage vs PSG
  # [ "Paris Saint Germain", "The they are evenly matched, but PSG will win", nil, 2, 1, 32],
  # [ "North Carolina Courage", "The courage knows how to win even without their internationals", nil, 2, 8, 32],
  # [ "North Carolina Courage", "If Dunn gets to play, it's over", nil, 2, 8, 32],
  # [ "Paris Saint Germain", "High quality, well rested", nil, 2, 5, 32],
  #
  # # 33
  # # Lyon vs Man City
  # [ "Manchester City", "Man City will hang on and win", nil, 2, 1, 33],
  # [ "Olympic Lyonnais", "Best team in the world will destroy Man City", nil, 2, 8, 33],
  # [ "Olympic Lyonnais", "They are just so good", nil, 2, 3, 33],
  # [ "Manchester City", "They will be better prepared", nil, 2, 5, 33]
]

# predictions_list.each do |prediction|
#   Prediction.create!(guess: prediction[0], reason: prediction[1], correct?: prediction[2], likes: prediction[3], user_id: prediction[4], match_id: prediction[5])
# end

# Issues:
# encrypted_password => password as specified in devise docs
# added 'optional: true' to belongs_to associations
# Had to remove 'remove email from users' migration
# Small issues where certain foreign keys werent present (i.e. predictions list where user 5 made the predicition but we only had 4...)
