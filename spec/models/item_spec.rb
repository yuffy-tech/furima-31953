require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
 

  describe '#create' do
    context '商品出品がうまくいくとき' do
# 1. :name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :priceが存在すれば登録できること
          it "name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :priceが存在すれば登録できること" do
            expect(@item).to be_valid
          end
    end
# 2. nameが空では登録できないこと
    context '商品出品がうまくいかないとき' do
          it "nameが空では登録できないこと" do
            @item.name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end
# 3. category_idが空では登録できないこと
          it "category_idが空では登録できないこと" do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
          end
# 4. status_idが空では登録できないこと
          it "status_idが空では登録できないこと" do
            @item.status_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Status must be other than 1")
          end
# 5. delivery_burden_idが空では登録できないこと
          it "is invalid without a delivery_burden_id" do
            @item.delivery_burden_id = 1 
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery burden must be other than 1")
          end
# 6. start_area_idが空では登録できないこと
          it "start_area_idが空では登録できないこと" do
            @item.start_area_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Start area must be other than 1")
          end
# 7. delivery_day_idが空では登録できないこと
          it "delivery_day_idが空では登録できないこと" do
            @item.delivery_day_id = 1 
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
          end
# 8. priceが空では登録できないこと
          it "priceが空では登録できないこと" do
            @item.price = '' 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end
# 10. imageが空では登録できないこと
          it "imageが空では登録できないこと" do
            @item.image = nil 
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
# 11. textが空では登録できないこと
          it "textが空では登録できないこと" do
            @item.text = '' 
            @item.valid?
            expect(@item.errors.full_messages).to include("Text can't be blank")
          end

# 12. 価格の範囲が、半角数字で299以下は保存できない
           it "価格の範囲が、半角数字で299以下は保存できない" do
            @item.price = 200 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
           end
# 13. 価格の範囲が、半角数字で10000000以上は保存できない
           it "価格の範囲が、半角数字で10000000以上は保存できない" do
            @item.price = 11111111 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
           end
# 14. 販売価格は半角数字でなければ保存可能できない
           it '販売価格は半角数字でなければ保存可能できない' do
            @item.price = "１１１１"
            @item.valid?
            expect(@item.errors.full_messages).to include("Price is not a number")
           end
      end
    end
end