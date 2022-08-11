class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :price, :currency, :quantity
end
