require 'rails_helper'

RSpec.describe User, type: :model do
  describe '[Model : User] Success - バリデーションの確認' do
    # Signup
    context '適切な email と Password で新規登録する場合、' do
      it 'エラー無く特定の初期値でユーザー登録がされている' do
        user = create(:correct_user)
        # エラーが無い
        expect(user).to be_valid
        expect(user.errors).to be_empty
        # 適切な値が入っている
        expect(user.user_uid.length).to eq 20
        expect(user.screen_name.length).to eq 16
        expect(user.account_name).to eq '匿名さん'
        expect(user.gender).to eq 'unknown'
        expect(user.age).to eq 'unknown'
        expect(user.introduction).to eq 'よろしくお願いいたします'
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
    # Profile
    context '適切なプロフィール情報で編集する場合、' do
      it 'screen_name が文字数16文字以下の英数字なら登録可能' do
        user = build(:correct_user)
        # 英数字16文字以下
        user.screen_name = 'abcdef1234567890'
        user.save
        expect(user.screen_name).to eq 'abcdef1234567890'
      end
      it 'screen_name が文字数5文字以上の英数字なら登録可能' do
        user = build(:correct_user)
        # 5文字以上
        user.screen_name = 'abcde'
        user.save
        expect(user.screen_name).to eq 'abcde'
      end
      it 'account_name が文字数20文字以下の文字列なら登録可能' do
        user = build(:correct_user)
        # 5文字以上
        user.account_name = 'あいうえおaiueo12345/*-?!'
        user.save
        expect(user.account_name).to eq 'あいうえおaiueo12345/*-?!'
      end
      it 'account_name が文字数1文字以上の文字列なら登録可能' do
        user = build(:correct_user)
        # 英数字16文字以下
        user.account_name = 'あ'
        user.save
        expect(user.account_name).to eq 'あ'
      end
      it 'introduction が未入力でも登録可能' do
        user = build(:correct_user)
        # 5文字以上
        user.introduction = nil
        user.save
        expect(user.introduction).to eq nil
      end
      it 'introduction が文字数160文字以下の文字列なら登録可能' do
        user = build(:correct_user)
        # 英数字16文字以下
        user.introduction = 'ekqlfJBMwUSMZ1ifSrsoZRZD7A4k0vXpDBahPrjdYgMZL5GoyUg1FLufG5FQnJGLDNkNUBp2XoyvyWZwi8mEx1evRiRri4yOzZLNBIQNgF2BnNyNBQdfcCe9kA6QMkcZNK3qtnUehO3YI7BYJKZWAjW1TWohxTkw'
        user.save
        expect(user.introduction.length).to eq 160
      end
      it 'profile_image はユーザー登録時には nil で登録される' do
        user = create(:correct_user)
        file = fixture_file_upload(Rails.root.join('spec/support/app_logo.png'), 'image/png')
        expect(user.profile_image.url).not_to be_present
      end
      it 'profile_image は更新時に画像ファイル名をランダム文字列にしている' do
        user = create(:correct_user)
        file = fixture_file_upload(Rails.root.join('spec/support/app_logo.png'), 'image/png')
        user.profile_image = file
        user.save

        expect(user.profile_image).to be_present
        expect(user.profile_image.url).not_to include('app_logo.png')
      end
    end
  end

  describe '[Model : User] Error - バリデーションの確認' do
    let(:correct_user) { create(:correct_user) }
    let(:build_incorrect_email_user) { build(:incorrect_email_user) }
    let(:build_incorrect_password_user1) { build(:incorrect_password_user1) }
    let(:build_incorrect_password_user2) { build(:incorrect_password_user2) }
    let(:incorrect_file) { fixture_file_upload(Rails.root.join('spec/support/pg.webp'), 'image/webp') }

    # Signup
    context '不適切な email で新規登録する場合、' do
      it 'email のバリデーションエラーが発生する' do
        expect(build_incorrect_email_user).to be_invalid
        expect(build_incorrect_email_user.errors).to be_present
        expect(build_incorrect_email_user.email).not_to match(/\A[^@\s]+@[^@\s]+\z/)
      end
    end
    context '不適切な password で新規登録する場合、' do
      it 'password の文字数不足しているためバリデーションエラーが発生する' do
        expect(build_incorrect_password_user1).to be_invalid
        expect(build_incorrect_password_user1.errors).to be_present
        expect(build_incorrect_password_user1.errors[:password][0]).to include("8文字以上で入力してください")
      end
      it 'password の文字数超過しているためバリデーションエラーが発生する' do
        expect(build_incorrect_password_user2).to be_invalid
        expect(build_incorrect_password_user2.errors).to be_present
        expect(build_incorrect_password_user2.errors[:password][0]).to include("128文字以内で入力してください")
      end
    end
    # Profile
    context '不適切なプロフィール情報で編集する場合、' do
      it 'screen_name が文字数16文字超過ならバリデーションエラーが発生する' do
        correct_user.screen_name = 'abcdef1234567890a'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.errors[:screen_name][0]).to include("16文字以内で入力してください")
      end
      it 'screen_name が文字数5文字以下ならバリデーションエラーが発生する' do
        correct_user.screen_name = '1234'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.errors[:screen_name][0]).to include("5文字以上で入力してください")
      end
      it 'screen_name が英数字以外が混在しているならバリデーションエラーが発生する' do
        # 英数字以外が混在している
        correct_user.screen_name = 'あabc123'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        # 記号が混在している
        correct_user.screen_name = '!abc123'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
      end
      it 'account_name が文字数20文字超過ならバリデーションエラーが発生する' do
        correct_user.account_name = 'あいうえおaiueo12345/*-?!あ'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.errors[:account_name][0]).to include("20文字以内で入力してください")
      end
      it 'account_name が未入力ならバリデーションエラーが発生する' do
        correct_user.account_name = ''
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.errors[:account_name][0]).to include("入力してください")
      end
      it 'introduction が文字数160文字超過の文字列ならならバリデーションエラーが発生する' do
        correct_user.introduction = 'ekqlfJBMwUSMZ1ifSrsoZRZD7A4k0vXpDBahPrjdYgMZL5GoyUg1FLufG5FQnJGLDNkNUBp2XoyvyWZwi8mEx1evRiRri4yOzZLNBIQNgF2BnNyNBQdfcCe9kA6QMkcZNK3qtnUehO3YI7BYJKZWAjW1TWohxTkwあ'
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.errors[:introduction][0]).to include("160文字以内で入力してください")
      end
      it 'profile_image に jpg jpeg png 以外の不適切な形式のファイルを保存しようとするとバリデーションが発生する' do
        correct_user.profile_image = incorrect_file
        correct_user.save
        expect(correct_user).to be_invalid
        expect(correct_user.errors).to be_present
        expect(correct_user.profile_image.url).not_to be_present
      end
    end
  end
end
