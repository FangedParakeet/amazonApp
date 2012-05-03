class CartsController < ApplicationController

  def index
    @items = Item.all
    @items.each do |item|
      if Cart.find_by_name(item.name).nil?
        c = Cart.new
        c.name = item.name
        c.price = item.price
        c.quantity = 0
        c.save
      else
        c = Cart.find_by_name(item.name)
        c.price = item.price
        c.save
      end
    end
    @carts = Cart.all
    @carts.each do |cart|
      if Item.find_by_name(cart.name).nil?
        c = Cart.find_by_name(cart.name)
        c.destroy
      end
    end
    @carts = Cart.all    
  end

end