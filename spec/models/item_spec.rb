require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品ができる時' do
    it 'すべての値が正しく入力されていれば登録ができる' do
      expect(@item).to be_valid
    end

    it '価格が¥300以上だと出品ができる' do
      @item.item_price = 300
      @item.valid?
      expect(@item).to be_valid
    end

    it '価格が¥10000000未満だと出品ができる' do
      @item.item_price = 9999999
      @item.valid?
      expect(@item).to be_valid
    end
  end

  context '商品出品ができない時' do
    it '商品画像が空だと出品ができない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it '商品名が空だと出品ができない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item name can't be blank"
    end

    it '商品説明が空だと出品ができない' do
      @item.item_explain = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item explain can't be blank"
    end

    it 'カテゴリーが選択されてないと出品ができない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Category is Unselected'
    end

    it '商品の状態が選択されてないと出品ができない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Condition is Unselected'
    end

    it '配送料の負担が選択されてないと出品ができない' do
      @item.charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Charge is Unselected'
    end

    it '発送元の地域が選択されてないと出品ができない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Prefecture is Unselected'
    end

    it '発送までの日数が選択されてないと出品ができない' do
      @item.sending_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include 'Sending day is Unselected'
    end

    it '価格が入力されてないと出品ができない' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item price can't be blank"
    end

    it '価格が全角で入力されていると出品ができない' do
      @item.item_price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Item price is invalid. Input Half-width number'
    end

    it '価格が¥300未満だと出品ができない' do
      @item.item_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include 'Item price is Out of setting range'
    end

    it '価格が¥10000000以上だと出品ができない' do
      @item.item_price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include 'Item price is Out of setting range'
    end

    it '半角英数混合だと出品ができない' do
      @item.item_price = '10aa'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Item price is invalid. Input Half-width number'
    end

    it '半角英語だと出品ができない' do
      @item.item_price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include 'Item price is invalid. Input Half-width number'
    end
  end
end
