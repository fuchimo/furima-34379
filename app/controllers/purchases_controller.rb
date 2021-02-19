class PurchasesController < ApplicationController
  before_action :move_to_signup, only: [:index, :create]
  before_action :set_params, only: [:index, :create]
  before_action :different_user_redirect, only: [:index, :create]
  before_action :sold_out_redirect, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    #@item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def different_user_redirect
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_redirect
    redirect_to root_path if Purchase.find_by(item_id: @item.id)
  end

end
