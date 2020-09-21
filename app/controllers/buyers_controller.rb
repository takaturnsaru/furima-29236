class BuyersController < ApplicationController
  before_action :item_data, only: [:index,:create,:move_to_root]
  before_action :move_to_root
  def index
    @buyer = BuyerAddress.new
  end
  

  def create
    @buyer = BuyerAddress.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to items_path
    else
      render :index
    end
  end
  
  private

  def item_data
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path 
    end
  end

  def buyer_params
    params.permit(:postal_code,:prefectures_id,:city,:address,:building_name,:phone_number,:token,).merge(user_id:current_user.id,item_id:params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency:"jpy"
    )
  end
end
# pay_itemメソッドの中で@item = Item.find(params[:id])を定義をする
# @itemからpriceを抜き取る

