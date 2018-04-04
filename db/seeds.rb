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
