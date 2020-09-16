class BuyersController < ApplicationController
  before_action :move_to_root
  def index
    
  end
  

  def create
    @address = Address.new(address_params)
    @address.save
      if @address.valid?
        redirect item_path
      else
        render :new
      end
  end
  private

  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
