class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :check_sold_out, only: [:index]
  before_action :move_to_new_user_session, only: [:index]
  
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipping_address = OrderShippingAddress.new 
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)
    if @order_shipping_address.valid?
      pay_item
      @order_shipping_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'orders/index', status: :unprocessable_entity
    end
  end

  private

  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_shipping_address_params[:token],
        currency: 'jpy'
      )
  end

  def check_sold_out
    if @item.sold_out? || @item.user == current_user
      redirect_to root_path
    end
  end

  def move_to_new_user_session
    return if current_user
    redirect_to new_user_session_path unless user_signed_in?
  end 
end