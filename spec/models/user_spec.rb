require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 

 describe User do
  describe '#create' do
# 1. nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation" do
      expect(@user).to be_valid
    end
# 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
# 3. emailが空では登録できないこと
    it "is invalid without a email" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
# 4. first_nameが空では登録できないこと
    it "is invalid without a first_name" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
# 5. last_nameが空では登録できないこと
    it "is invalid without a last_name" do
      @user.last_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
# 6. birth_dateが空では登録できないこと
    it "is invalid without a birth_date" do
      @user.birth_date = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
# 7. last_name_kanaが空では登録できないこと
    it "is invalid without a last_name_kana" do
      @user.last_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
# 8. first_name_kanaが空では登録できないこと
    it "is invalid without a first_name_kana" do
      @user.first_name_kana = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
# 9. passwordが空では登録できないこと
    it "is invalid without a password" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
# 10. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
# 11. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
# 12. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 6 characters " do
      @user.password = "gakuen11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
# 13. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      @user.password = "gaku1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
# 14. last_name_kanaがカタカナでないと登録できないこと
  describe 'katakana' do
    it 'last_name_kanaがカタカナで返ること' do
      @user.last_name_kana = "yasuhiro"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
# 15. first_name_kanaがカタカナでないと登録できないこと     
    it 'first_name_kanaがカタカナで返ること' do
      @user.first_name_kana = "shimai"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end
end