class CreateProgresses < ActiveRecord::Migration
  def self.up
    create_table :progresses do |t|
      t.string :user
      t.string :level
      t.datetime :completed
      t.timestamps
    end
  end

  def self.down
    drop_table :progresses
  end
end
