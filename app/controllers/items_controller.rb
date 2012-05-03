class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def create
    i = Item.new
    i.name = params[:item][:name]
    i.price = params[:item][:price]
    i.save
    redirect_to items_url
  end
  
  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find_by_id(params[:id])
  end
  
  def update
    i = Item.find_by_id(params[:id])
    i.name = params[:item][:name]
    i.price = params[:item][:price]
    i.save
    redirect_to items_url
  end
  
  def destroy
    i = Item.find_by_id(params[:id])
    i.destroy
    redirect_to items_url
  end
  
  def edit
    @item = Item.find_by_id(params[:id])
  end
  
end