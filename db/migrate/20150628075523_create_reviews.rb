class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :star
      t.string :comment
      t.string :dosage_feedback
      t.integer :product_id
      t.integer :recommendation_id
      t.timestamps null: false
    end
  end
end
