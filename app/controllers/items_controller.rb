class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @items = Item.includes(:user)
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:status_id,:shipping_cost_id,:prefecture_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

  #def move_to_index
    #redirect_to root_path unless user_signed_in?
  #end
  
end
