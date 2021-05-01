require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_form = FactoryBot.build(:item_buy, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '必須項目が全て入力されていれば購入できる' do
        expect(@item_form).to be_valid
      end
      it '建物名が空でも購入できる' do
        @item_form.building_name = ''
        expect(@item_form).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it '郵便番号が空では購入ができない' do
        @item_form.postal_code = ''
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがなければ購入ができない' do
        @item_form.postal_code = '1111111'
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が空では購入ができない' do
        @item_form.start_area_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Start_Area must be other than 1")
      end
    end
  end
end