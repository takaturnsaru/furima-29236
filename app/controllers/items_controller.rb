class ItemsController < ApplicationController
  before_action :move_to_login, except:[:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)

  end

 private

    def item_params
      params.require(:item).permit(:name,:explanation,:category_id,:status_id,:shipping_fee_id,:shipping_area_id,:day_until_shipping_id,:price,:image).merge(user_id: current_user.id)
    end

    def move_to_login
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end

  end


