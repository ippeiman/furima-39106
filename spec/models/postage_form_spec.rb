require 'rails_helper'

RSpec.describe PostageForm, type: :model do
  describe '配送先情報の保存' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @postage_form = FactoryBot.build(:postage_form, user_id: user.id, item_id: item.id)
  end

    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@postage_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @postage_form.user_id = 1
        expect(@postage_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @postage_form.item_id = 1
        expect(@postage_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @postage_form.post_code = '123-4560'
        expect(@postage_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @postage_form.shipping_area_id = 1
        expect(@postage_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @postage_form.city = '横浜市'
        expect(@postage_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @postage_form.house_number = '旭区１２３'
        expect(@postage_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @postage_form.building_name = nil
        expect(@postage_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @postage_form.phone_number = 12_345_678_910
        expect(@postage_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @postage_form.user_id = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @postage_form.item_id = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @postage_form.post_code = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @postage_form.post_code = 1_234_567
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @postage_form.shipping_area_id = 0
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @postage_form.shipping_area_id = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @postage_form.city = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @postage_form.house_number = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @postage_form.phone_number = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @postage_form.phone_number = '123 - 1234 - 1234'
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @postage_form.phone_number = 12_345_678_910_123_111
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @postage_form.phone_number = 12_345_678
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @postage_form.token = nil
        @postage_form.valid?
        expect(@postage_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end