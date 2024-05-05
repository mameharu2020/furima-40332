class OrdersController < ApplicationController

  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create

  end

  #private

  #def メソッド名
    #params.permit(指定のカラムを記述する)
  #end

end
