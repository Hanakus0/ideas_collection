require 'rails_helper'

RSpec.describe Follow, type: :model do
  # ユーザー
  let(:follower_user) { create(:user) }
  let(:followee_user) { create(:user) }
  # フォロー
  let(:follow_relation) { build(:follow, follower: follower_user, followee: followee_user) }

  # TEST
  describe '[Model : Follow] フォローレコードの確認' do
    context 'ユーザーAがユーザーBをフォローする際、' do
      it 'フォローレコードが生成される' do
        expect(follow_relation).to be_valid
        expect(follow_relation.errors).to be_empty
        # 外部キーの確認
        expect(follow_relation.follower_id).to eq follower_user.id
        expect(follow_relation.followee_id).to eq followee_user.id
      end
    end
  end
end
