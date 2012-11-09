class User < ActiveRecord::Base
  def next_level
    return (Level.all - self.get_completed).first
  end

  def get_completed
    return Progress.where(:user => self.name).to_a.map {|p| p.level }
  end
end
