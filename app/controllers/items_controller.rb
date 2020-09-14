class ItemsController < ApplicationController
  before_action :move_to_login, except:[:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
    
  end
  
 private

    def item_params
      params.require(:item).permit(:name,:explanation,:category,:status,:shipping_fee,:shipping_area,:day_until_shipping,:price,:image).merge(user_id: current_user.id)
    end

    def move_to_login
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end

  end


