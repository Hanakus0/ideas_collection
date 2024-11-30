require 'rails_helper'

RSpec.describe User, type: :model do
  describe '[Model : User] バリデーションの確認' do
    # Success
    context '適切な email と Password であれば問題なく新規登録する場合' do
      it 'エラー無くユーザー登録が出来る' do
        user = create(:correct_user)
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
    end
    context '適切な email と Password であれば問題なく新規登録する場合' do
      it 'email が被らない場合、バリデーションエラーが起きないか' do
        user = create(:correct_user)
        user2 = create(:correct_user)
        expect(user2).to be_valid
        expect(user2.errors).to be_empty
      end
    end
    # Error
    context '適切な email と Password であれば問題なく新規登録する場合' do
      it 'email が被らない場合、バリデーションエラーが起きないか' do
        user = create(:correct_user)
        user2 = create(:correct_user)
        expect(user2).to be_valid
        expect(user2.errors).to be_empty
      end
    end
  end


end
