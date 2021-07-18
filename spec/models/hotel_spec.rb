require 'rails_helper'

RSpec.describe Hotel, type: :model do
  before do
    @hotel = FactoryBot.build(:hotel)
  end

  describe 'ホテル掲載' do
    context 'ホテル掲載できる時' do
       it 'hotel_nameとdescriptionとpostal_code, prefecture_id, city, house_numberが存在すれば登録できる' do
        expect(@hotel).to be_valid
       end
    end
    context 'ホテル掲載できない時' do
      it 'hotel_nameが空では登録できない' do
        @hotel.hotel_name = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Hotel name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @hotel.description = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Description can't be blank")
      end
      it 'postal_codeが空では登録できない' do
        @hotel.postal_code = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では登録できない' do
        @hotel.prefecture_id = 1
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では登録できない' do
        @hotel.city = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @hotel.house_number = ''
        @hotel.valid?
        expect(@hotel.errors.full_messages).to include("House number can't be blank")
      end
    end
  end
end
