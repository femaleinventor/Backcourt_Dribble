class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :predictions

  validate :restrict_username


  CHARS = ["-", "_", "", "."]
  NAMES = ["ethan fertsch", "denise duffy", "liam the dog"]

  # def restrict_username(array, user_input)
  #   user_input.downcase
  #   error_message = "Sorry, that username is restricted. Please try again."
  #   if array.include?(user_input)
  #     error_message
  #   end
  # end


#Need to validate for certain usernames. Broken.
  def restrict_username
    restricted_usernames = build_restricted_usernames_set(NAMES, CHARS)
    puts restricted_usernames
    if restricted_usernames.include?(:username)
      puts 'CATS ARE SOFT'
    else
      puts @username + "doggo"
      puts 'DOGS ARE SMART'
      # errors.add(:username, :exclusion)
    end
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






end
