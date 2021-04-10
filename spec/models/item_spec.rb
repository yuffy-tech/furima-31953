require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('public/image/test_image.png')
  end
 

  describe '#create' do
    context '商品出品がうまくいくとき' do
# 1. :name, :image, :text, :category_id, :status_id, :delivery_burden_id, :start_area_id, :delivery_day_id, :priceが存在すれば登録できること
          it "is valid with a name, image, text, category_id, status_id, delivery_burden_id, start_area_id, delivery_day_id, price" do
            # @item.name                = '任天堂スイッチ'
            # @item.image               = {after(:build) do |item|
            #   item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
            #  end}
            # @item.text                = '未使用で、誰も使わなかった'
            # @item.category_id         =  {1}
            # @item.status_id           =  {1}
            # @item.delivery_burden_id  =  {1}
            # @item.start_area_id       =  {1}
            # @item.delivery_day_id     =  {1}
            # @item.price               =  {"5000"}
            expect(@item).to be_valid
          end
    end
# 2. nameが空では登録できないこと
    context '商品出品がうまくいかないとき' do
          it "is invalid without a name" do
            @item.name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end
# 3. category_idが空では登録できないこと
          it "is invalid without a category_id" do
            @item.category_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Category must be other than 1")
          end
# 4. status_idが空では登録できないこと
          it "is invalid without a status_id" do
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
          it "is invalid without a start_area_id" do
            @item.start_area_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Start area must be other than 1")
          end
# 7. delivery_day_idが空では登録できないこと
          it "is invalid without a delivery_day_id" do
            @item.delivery_day_id = 1 
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
          end
# 8. priceが空では登録できないこと
          it "is invalid without a price" do
            @item.price = '' 
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end
# 10. imageが空では登録できないこと
          it "is invalid without a imege" do
            @item.image = nil 
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
# 11. textが空では登録できないこと
          it "is invalid without a text" do
            @item.text = '' 
            @item.valid?
            expect(@item.errors.full_messages).to include("Text can't be blank")
          end
      end
    end
end