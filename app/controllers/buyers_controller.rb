class BuyersController < ApplicationController
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

end
