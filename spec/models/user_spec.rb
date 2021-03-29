require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 

  describe '#create' do
    context '新規登録がうまくいくとき' do
# 1. nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること
          it "is valid with a nickname, email, password, password_confirmation" do
            @user.nickname = 'gakuen114'
            @user.email = 'gakuen117@yahoo.co.jp'
            expect(@user).to be_valid
          end
          it "passwordが半角英数字混合で６文字以上" do
            @user.password = 'aaaaa11'
            @user.password_confirmation = 'aaaaa11'
            expect(@user).to be_valid
          end
    end
# 2. nicknameが空では登録できないこと
    context '新規登録がうまくいかないとき' do
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
            expect(@user.errors.full_messages).to include("Password can't be blank")
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
# 12. passwordが6文字以下であれば登録できないこと
          it "is invalid with a password that has less than 6 characters " do
            @user.password = "gaku1"
            @user.valid?
            expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
          end
    end
  end
# 13. last_name_kanaがカタカナでないと登録できないこと
  describe '条件' do
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
# 16. emailは＠を含んでいなければ登録できないこと
    it 'emailが@を含むこと' do
     @user.email = "gakuenyahoo.co.jp"
     @user.valid?
     expect(@user.errors.full_messages).to include("Email is invalid")
  
    end
# 17・ユーザー本名（苗字）は漢字・平仮名・カタカナ以外では登録できないこと
    it 'first_nameがユーザー本名（苗字）は漢字・平仮名・カタカナ以外で返ること' do
      @user.first_name = "shimai"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")

    end
# 18・ユーザー本名（名前）は漢字・平仮名・カタカナ以外では登録できないこと
    it 'last_name_kanaがユーザー本名（苗字）は漢字・平仮名・カタカナ以外で返ること' do
      @user.last_name_kana = "shimai"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
# 19・英語のみでは登録できないこと
    it 'passwordが英語以外で返ること' do
      @user.password = "gakuen"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
# 20・数字のみでは登録できないこと
    it 'passwordが数字以外で返ること' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
# 21・全角では登録できないこと
it 'passwordが全角以外で返ること' do
     @user.password = "AAAAA１"
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end