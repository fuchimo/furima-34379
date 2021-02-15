require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録ができる時' do
    it 'すべての値が正しく入力されていれば登録ができる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録ができない時' do
    it 'nicknameが空だと登録ができない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'emailが空だと登録ができない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailが既存のデータと重複していると登録ができない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end

    it 'emailに＠がないと登録ができない' do
      @user.email = 'samplesample'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'passwordが空だと登録ができない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが6文字以下だと登録ができない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'passwordが6文字以上でも半角英数字混合でなければ登録ができない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid.'
    end

    it 'passwordとpassword_confirmationの値が一致していないと登録ができない' do
      @user.password = '111222'
      @user.password_confirmation = '333444'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'first_nameが空白だと登録ができない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'last_nameが空白だと登録ができない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'first_nameは全角でなければ登録ができない' do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
    end

    it 'last_nameは全角でなければ登録ができない' do
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
    end

    it 'first_name_readingが空白だと登録ができない' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name reading can't be blank"
    end

    it 'last_name_readingが空白だと登録ができない' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name reading can't be blank"
    end

    it 'first_name_readingは全角カナでなければ登録ができない' do
      @user.first_name_reading = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name reading is invalid. Input full-width katakana characters.'
    end

    it 'last_name_readingは全角カナでなければ登録ができない' do
      @user.last_name_reading = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name reading is invalid. Input full-width katakana characters.'
    end

    it 'birth_dateが空白だと登録ができない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
