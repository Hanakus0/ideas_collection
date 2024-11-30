require 'rails_helper'

RSpec.describe User, type: :model do
  describe '[Model : User] バリデーションの確認' do
    # Success
    context '適切な email と Password で新規登録する場合、' do
      it 'エラー無くユーザー登録が出来る' do
        user = create(:correct_user)
        expect(user.email).to match(/\A[^@\s]+@[^@\s]+\z/)
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
      it 'email が他ユーザーと重複しなければエラー無くユーザー登録が出来る' do
        user = create(:correct_user)
        user2 = create(:correct_user)
        expect(user.email).to match(/\A[^@\s]+@[^@\s]+\z/)
        expect(user2.email).to match(/\A[^@\s]+@[^@\s]+\z/)
        expect(user2).to be_valid
        expect(user2.errors).to be_empty
      end
    end
    # Error
    context '不適切な email で新規登録する場合、' do
      it 'email のバリデーションエラーが発生する' do
        user = build(:incorrect_email_user)
        expect(user).to be_invalid
        expect(user.email).not_to match(/\A[^@\s]+@[^@\s]+\z/)
        expect(user.errors).not_to be_empty
      end
    end
    context '不適切な password で新規登録する場合、' do
      it 'password のバリデーションエラーが発生する' do
        user = build(:incorrect_password_user)
        expect(user).to be_invalid
        expect(user.email).to match(/\A[^@\s]+@[^@\s]+\z/)
        expect(user.errors).not_to be_empty
      end
    end
  end


end
