require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end


  describe '商品購入者情報の保存' do
    context '購入がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'post_numberにハイフンが含まれていれば保存できる' do
        @order_address.post_number = "222-2222"
        expect(@order_address).to be_valid
      end
      it 'delivery_area_idで1以外を選択すれば保存できる' do
        @order_address.delivery_area_id = "2"
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁以内でハイフンが含まれてなければ保存できる' do
        @order_address.phone_number = "33333333333"
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかない時' do
      it 'post_numberが空だと保存できない' do
        @order_address.post_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post numberを入力してください")
      end
      it 'post_numberはハイフンがなければ保存できない' do
        @order_address.post_number = "2222222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post numberを正しく入力してください")
      end
      it 'delivery_area_idで1を選択すると保存できない' do
        @order_address.delivery_area_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery areaを選択してください")
      end
      it 'municipalityが空だと保存されない' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalityを入力してください")
      end
      it 'addressが空だと保存されない' do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addressを入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'phone_numberが11桁以内でハイフンを含んでいると保存できない' do
        @order_address.phone_number = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberを正しく入力してください")
      end
    end
  end
end

  
