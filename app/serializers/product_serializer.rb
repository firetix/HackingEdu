class ProductSerializer < ActiveModel::Serializer
  attributes :id, :have_photo, :product_name, :product_name_2, :manufacturer,:flavor,:category,:quantity,:thc_dose,:nb_dose,:thc,:dry_weed,:cbd_dose,:thc_3_party,:type_strain,:unit_of_mesure, :thc_uom, :ingredients, :dairy, :nutritions_extra, :created_at, :updated_at, :nuts, :dispenary_name, :file_name, :file_name_2,:extract_type
end
