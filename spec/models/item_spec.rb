require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end

  describe '商品出品情報の保存' do
    context '出品がうまくいく時' do
      it 'name, explanation, category_id, item_status_id, item_burden_id, delivery_area_id, shipping_day_id, imageが存在すれば出品できる。' do
        expect(@item).to be_valid
      end
      it 'selling_priceが半角数字のみであれば保存できる' do
        @item.selling_price = '2222'
        expect(@item).to be_valid
      end
      it 'selling_peiceの範囲が300~9999999であれば保存できる' do
        @item.selling_price = '5555'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'nameが空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Nameを入力してください')
      end
      it 'explanationが空だと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanationを入力してください')
      end
      it 'category_idを選択してないと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Categoryを選択してください')
      end
      it 'item_status_idを選択してないと保存できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item statusを選択してください')
      end
      it 'item_burden_idを選択してないと保存できない' do
        @item.item_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item burdenを選択してください')
      end
      it 'delivery_area_idを選択してないと保存できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery areaを選択してください')
      end
      it 'shipping_day_idを選択してないと保存できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping dayを選択してください')
      end
      it 'selling_priceが空だと保存できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling priceを入力してください')
      end
      it 'selling_priceが半角数字でないと保存できない' do
        @item.selling_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling priceは半角数字で入力してください')
      end
      it 'selling_priceが300円未満だと保存できない' do
        @item.selling_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price範囲外です')
      end
      it 'selling_priceが9,999,999円を超過すると保存できない' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price範囲外です')
      end
      it 'imageが存在してないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Imageを選択してください')
      end
    end
  end
end
