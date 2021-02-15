class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end
  

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explain, :item_price, :category_id, :condition_id, :charge_id, :prefecture_id, :sending_days_id).merge(user_id: params[:user.id])
  end

end
