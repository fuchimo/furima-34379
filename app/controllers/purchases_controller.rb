class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :purchase, :item_id ).merge(user_id: current_user.id)
  end

end
