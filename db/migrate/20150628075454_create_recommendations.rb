class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :sport
      t.string :eaten
      t.string :alcohol
      t.string :checkin_start
      t.timestamps null: false
    end
  end
end
