require 'rails_helper'

RSpec.describe ItemForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_form = FactoryBot.build(:item_form, user_id: user.id, item_id: item.id)
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
        expect(@item_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空では購入ができない' do
        @item_form.start_area_id = 1
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Start area must be other than 1")
      end

      it '市町村が空では登録ができない' do
        @item_form.municipality = " "
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では購入ができない' do
        @item_form.address = " "
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号にはハイフンがあると購入ができない' do
        @item_form.phone_number = "123-1234-1234"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number is invalid.")
      end

      it '電話番号は12桁以上では購入ができない' do
        @item_form.phone_number = "123123123123123"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number is invalid.")
      end

        it '電話番号は全角数字では購入ができない' do
        @item_form.phone_number = "１２３４５６７８９０１"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Phone number is invalid.")
      end

      it '電話番号は英数字混同では購入ができない' do
        @item_form.start_area_id = "00a12345678"
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Start area is not a number")
      end

      it 'クレジットカード入力がなければ購入ができない' do
        @item_form.token = ""
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idがないと登録できない' do
        @item_form.user_id = ""
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できない' do
        @item_form.item_id = ""
        @item_form.valid?
        expect(@item_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end