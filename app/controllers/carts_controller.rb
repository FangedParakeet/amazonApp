class CartsController < ApplicationController

  def index
    @items = Item.all
    @items.each do |item|
      if Cart.find_by_name(item.name).nil?  # --> If item is available, but not in cart, add to cart
        c = Cart.new
        c.name = item.name
        c.price = item.price
        c.quantity = 0
        c.save
      else
        c = Cart.find_by_name(item.name)  #--> If item is available and in cart, make sure price is up to date
        c.price = item.price
        c.save
      end
    end
    @carts = Cart.all
    @carts.each do |cart|
      if Item.find_by_name(cart.name).nil?  # --> If item is in cart, but unavailable, remove from cart
        c = Cart.find_by_name(cart.name)
        c.destroy
      end
    end   # --> ^ Makes sure that shopping cart is up to date with available items
    @total = 0
    @carts.each do |cart|
      @total += (cart.price * cart.quantity)
    end
    @carts = Cart.all    
  end
  
  def update
    @items = Item.all
    @items.each do |item|
      if Cart.find_by_name(item.name).nil?  # --> If item is available, but not in cart, add to cart
        c = Cart.new
        c.name = item.name
        c.price = item.price
        c.quantity = 0
        c.save
      else
        c = Cart.find_by_name(item.name)  #--> If item is available and in cart, make sure price is up to date
        c.price = item.price
        c.save
      end
    end   #--> Makes sure all available items are in cart before making adjustments to quantities (if item has just been created 
          #    before "Add to Cart" request, item must be first added to Cart before quantity can be changed)
          
    if params[:id].to_i == 0  # --> If params[:id] delivers a string (send is from "Add to Cart" not "Update Quantity")
      c = Cart.find_by_name(params[:id])
      c.quantity += 1
      c.save
    else  # --> Else params[:id] is an integer (send is from "Update Quantity" not "Add to Cart")
      c = Cart.find_by_id(params[:id])
      c.quantity = params[:quantity]
      c.save
    end
    redirect_to carts_url    
  end

end