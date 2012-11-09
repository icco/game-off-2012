class Progress < ActiveRecord::Base
  def self.succeed level_name, user_name
    Progress.create({:level => level_name, :user => user_name})
  end
end
