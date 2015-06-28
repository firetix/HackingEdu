class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :have_photo
      t.string :manufacturer
      t.string :product_name
      t.string :product_name_2
      t.string :flavor
      t.string :category
      t.string :quantity
      t.string :thc_dose
      t.string :nb_dose
      t.string :thc
      t.string :dry_weed
      t.string :cbd_dose
      t.string :thc_3_party
      t.string :type_strain
      t.string :unit_of_mesure
      t.string :thc_uom
      t.string :ingredients
      t.string :dairy
      t.string :nutritions_extra
      t.timestamps null: false
    end
  end
end
