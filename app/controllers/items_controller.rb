class ItemsController < ApplicationController
  before_action :move_to_signup, except: [:index, :show]
  before_action :set_params, only: [:show, :edit, :update]
  before_action :different_user_redirect, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explain, :item_price, :category_id, :condition_id, :charge_id,
                                 :prefecture_id, :sending_day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_signup
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def different_user_redirect
    redirect_to root_path if current_user.id != @item.user_id
  end
end
