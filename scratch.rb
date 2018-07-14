# Creating restricted usernames and validation at sign-up
# -------------------------------------------------------

  # validate :restrict_username

  # def restrict_username
  #   restricted_usernames = build_restricted_usernames_set(NAMES, CHARS)
  #   puts restricted_usernames
  #   # if restricted_usernames.include?(username)
  #   #   puts 'CATS ARE SOFT'
  #   # else
  #   #   puts 'DOGS ARE SMART'
  #   # end
  # end
  #
  # # Generates a single restricted username
  # def generate_restricted_username(name, char)
  #   return name.gsub(' ', char)
  # end
  #
  # # Generates a collection of restricted usernames
  # def build_restricted_usernames_set(protected_names, special_chars)
  #   restricted_names = []
  #   protected_names.each do |name|
  #     special_chars.each do |char|
  #       restricted_names.push(generate_restricted_username(name, char))
  #     end
  #   end
  #   return restricted_names
  # end
