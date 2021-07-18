require 'rails_helper'

RSpec.describe Owner, type: :model do
  before do
    @owner = FactoryBot.build(:owner)
  end

  describe 'オーナー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemailとpasswordが存在すれば登録できる' do
        expect(@owner).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @owner.nickname = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @owner.email = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @owner.password = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @owner.password = 'aaaaaaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @owner.password = '7777777'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @owner.password = '全角英数字のみ'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordが6文字以下では登録できない' do
        @owner.password = 'aaa666'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @owner.password = 'aaa7777'
        @owner.password_confirmation = 'bbb7777'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @owner.last_name = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last name can't be blank",
                                                      'Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが空では登録できない' do
        @owner.first_name = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First name can't be blank",
                                                      'First name is invalid. Input full-width characters.')
      end
      it 'last_kanaが空では登録できない' do
        @owner.last_kana = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Last kana can't be blank",
                                                      'Last kana is invalid. Input full-width katakana characters.')
      end
      it ' first_nameが空では登録できない' do
        @owner.first_kana = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("First kana can't be blank",
                                                      'First kana is invalid. Input full-width katakana characters.')
      end
      it 'last_nameが全角でないと登録できない' do
        @owner.last_name = 'aaaaaaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが全角でないと登録できない' do
        @owner.first_name = 'aaaaaaaaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_kanaとfirst_kanaが全角カナでないと登録できない' do
        @owner.last_kana = '菅原'
        @owner.valid?
        expect(@owner.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters.')
      end
      it 'first_kanaが全角でないと登録できない' do
        @owner.first_kana = '文太'
        @owner.valid?
        expect(@owner.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters.')
      end
    end
  end
end
