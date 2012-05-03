class Cart < ActiveRecord::Base
  attr_accessible :name, :price, :quantity
end
