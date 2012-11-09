class Progress < ActiveRecord::Base
  def self.succeed level_name, user_name
    Progress.find_or_create_by_user_and_level(user_name, level_name)
  end
end
