class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  extend FriendlyId
  friendly_id :username, use: :slugged


  has_many :predictions

  validates :username, exclusion: { in: %w(Tierna-Davidson Tierna_Davidson TiernaDavidson Tierna.Davidson Ashley-Hatch Ashley_Hatch AshleyHatch Ashley.Hatch Lynn-Williams Lynn_Williams LynnWilliams Lynn.Williams Sofia-Huerta Sofia_Huerta SofiaHuerta Sofia.Huerta Mallory-Pugh Mallory_Pugh MalloryPugh Mallory.Pugh Mal-Pugh Mal_Pugh MalPugh Mal.Pugh Julie-Johnston-Ertz Julie_Johnston_Ertz JulieJohnstonErtz Julie.Johnston.Ertz Julie-Johnston Julie_Johnston JulieJohnston Julie.Johnston Julie-Ertz Julie_Ertz JulieErtz Julie.Ertz Savannah-McCaskill Savannah_McCaskill SavannahMcCaskill Savannah.McCaskill Crystal-Dunn Crystal_Dunn CrystalDunn Crystal.Dunn Ashlyn-Harris Ashlyn_Harris AshlynHarris Ashlyn.Harris Ali-Krieger Ali_Krieger AliKrieger Ali.Krieger Abby-Wambach Abby_Wambach AbbyWambach Abby.Wambach Aly-Wagner Aly_Wagner AlyWagner Aly.Wagner Morgan-Brian Morgan_Brian MorganBrian Morgan.Brian Casey-Short Casey_Short CaseyShort Casey.Short),
    message: "%{value} is a restricted username. Please choose another." }

  # validates_acceptance_of :terms_of_service, :allow_nil => false, :message => :terms_of_service_not_accepted, :on => :create



#NAMES TO Add
# Kelley-O'Hara
# Kelley_O'Hara
# KelleyO'Hara
# Kelley.O'Hara
# Abby-Dahlkemper
# Abby_Dahlkemper
# AbbyDahlkemper
# Abby.Dahlkemper
# Emily-Sonnett
# Emily_Sonnett
# EmilySonnett
# Emily.Sonnett
# Alyssa-Naeher
# Alyssa_Naeher
# AlyssaNaeher
# Alyssa.Naeher
# Megan-Rapinoe
# Megan_Rapinoe
# MeganRapinoe
# Megan.Rapinoe
# Carli-Lloyd
# Carli_Lloyd
# CarliLloyd
# Carli.Lloyd
# Allie-Long
# Allie_Long
# AllieLong
# Allie.Long
# Alex-Morgan
# Alex_Morgan
# AlexMorgan
# Alex.Morgan
# Andi-Sullivan
# Andi_Sullivan
# AndiSullivan
# Andi.Sullivan
# Becky-Sauerbrunn
# Becky_Sauerbrunn
# BeckySauerbrunn
# Becky.Sauerbrunn
# Jill-Ellis
# Jill_Ellis
# JillEllis
# Jill.Ellis
# Adrianna-Franch
# Adrianna_Franch
# AdriannaFranch
# Adrianna.Franch
# Taylor-Smith
# Taylor_Smith
# TaylorSmith
# Taylor.Smith
# Jaelene-Hinkle
# Jaelene_Hinkle
# JaeleneHinkle
# Jaelene.Hinkle
# Rose-Lavelle
# Rose_Lavelle
# RoseLavelle
# Rose.Lavelle
# McCall-Zerboni
# McCall_Zerboni
# McCallZerboni
# McCall.Zerboni
# Christen-Press
# Christen_Press
# ChristenPress
# Christen.Press
# Tobin-Heath
# Tobin_Heath
# TobinHeath
# Tobin.Heath
# Sydney-Leroux
# Sydney_Leroux
# SydneyLeroux
# Sydney.Leroux
# Christie-Rampone
# Christie_Rampone
# ChristieRampone
# Christie.Rampone
# Mia-Hamm
# Mia_Hamm
# MiaHamm
# Mia.Hamm
# Julie-Foudy
# Julie_Foudy
# JulieFoudy
# Julie.Foudy
# Hope-Solo
# Hope_Solo
# HopeSolo
# Hope.Solo
# Heather-O'Reilly
# Heather_O'Reilly
# HeatherO'Reilly
# Heather.O'Reilly


CHARS = ["-", "_", "", "."]
NAMES = [ "Tierna Davidson","Ashley Hatch","Lynn Williams","Sofia  Huerta","Mallory Pugh","Mal Pugh","Julie Johnston Ertz","Julie Johnston","Julie Ertz","Savannah McCaskill","Crystal Dunn","Ashlyn Harris","Ali Krieger","Abby Wambach","Aly Wagner","Morgan Brian","Casey Short","Kelley O'Hara","Abby Dahlkemper","Emily Sonnett","Alyssa Naeher","Megan Rapinoe","Carli Lloyd","Allie Long","Alex Morgan","Andi Sullivan","Becky Sauerbrunn","Jill Ellis","Adrianna Franch","Taylor Smith","Jaelene Hinkle","Rose Lavelle","McCall Zerboni","Christen Press","Tobin Heath","Sydney Leroux","Christie Rampone","Mia Hamm","Julie Foudy","Hope Solo","Heather O'Reilly"
]

#Need to validate for certain usernames. Broken.
  def restrict_username
    restricted_usernames = build_restricted_usernames_set(NAMES, CHARS)
    puts restricted_usernames
    # if restricted_usernames.include?(username)
    #   puts 'CATS ARE SOFT'
    # else
    #   puts 'DOGS ARE SMART'
    # end
  end

  # Generates a single restricted username
  def generate_restricted_username(name, char)
    return name.gsub(' ', char)
  end

  # Generates a collection of restricted usernames
  def build_restricted_usernames_set(protected_names, special_chars)
    restricted_names = []
    protected_names.each do |name|
      special_chars.each do |char|
        restricted_names.push(generate_restricted_username(name, char))
      end
    end
    return restricted_names
  end

  def calculate_percent_correct_predictions
    correct_predictions = self.predictions.where(correct?: true).count
    total_predictions = self.predictions.count

    percent_correct = (correct_predictions.to_f / total_predictions.to_f) * 100

    percent_correct.to_i
  end






end
