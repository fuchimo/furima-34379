require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  context '商品が購入できる時' do
    it 'すべての値が正しく入力されていれば購入ができる' do
      expect(@purchase_address).to be_valid
    end

    it '建物名が空白でも購入ができる' do
      @purchase_address.building_number = ""
      expect(@purchase_address).to be_valid
    end
  end

  context '商品が購入できない時' do
    it 'カード情報が空だと購入ができない' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Token can't be blank"
    end

    it '郵便番号が空だと購入ができない' do
      @purchase_address.postal_code = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code can't be blank"
    end

    it '都道府県が空だと購入ができない' do
      @purchase_address.prefecture_id = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Prefecture is Unselected"
    end

    it '市区町村が空だと購入ができない' do
      @purchase_address.city = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "City can't be blank"
    end

    it '番地が空だと購入ができない' do
      @purchase_address.house_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "House number can't be blank"
    end

    it '電話番号が空だと購入ができない' do
      @purchase_address.phone_number = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number can't be blank"
    end

    it '郵便番号に「-」がないと購入ができない' do
      @purchase_address.postal_code = "12345678"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
    end

    it '電話番号が11桁以上だと購入ができない' do
      @purchase_address.phone_number = "090123456789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end

    it '郵便番号が全角数字だと購入ができない' do
      @purchase_address.postal_code = "１２３４-５６７８"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
    end

    it '電話番号が全角数字だと購入ができない' do
      @purchase_address.phone_number = "０９０１２３４５６７８"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end

    it '郵便番号が半角英数字混合だと購入ができない' do
      @purchase_address.postal_code = "123-aaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
    end

    it '電話番号が半角英数字混合だと購入ができない' do
      @purchase_address.phone_number = "090aaaa5678"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end

    it '郵便番号が半角英字だと購入ができない' do
      @purchase_address.postal_code = "aaa-aaaa"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Postal code is invalid"
    end

    it '電話番号が半角英字だと購入ができない' do
      @purchase_address.phone_number = "aaabbbbcccc"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include "Phone number is invalid"
    end
  end
end