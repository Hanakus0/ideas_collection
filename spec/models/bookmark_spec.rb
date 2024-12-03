require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  # ユーザー
  let(:user) { create(:user) }
  # 投稿1
  let(:genre_tech) { create(:genre_tech) }
  let(:post1) { create(:post, post_genre: genre_tech) }
  # 投稿2
  let(:genre_entame) { create(:genre_entame) }
  let(:post2) { create(:post, post_genre: genre_entame) }
  # 投稿3
  let(:genre_game) { create(:genre_game) }
  let(:post3) { create(:post, post_genre: genre_game) }
  # ブックマーク
  let(:bookmark1) { create(:bookmark, user: user, post: post1) }
  let(:bookmark2) { create(:bookmark, user: user, post: post2) }
  let(:bookmark3) { create(:bookmark, user: user, post: post3) }

  # TEST
  describe '[Model : Bookmark] ブックマークのレコードの確認' do
    context 'ユーザーが投稿をブックマークする際、' do
      it 'ブックマークのレコードが生成される' do
        # 投稿1のブックマーク
        expect(bookmark1).to be_valid
        expect(bookmark1.errors).to be_empty
        expect(bookmark1.user_id).to eq user.id
        expect(bookmark1.post_id).to eq post1.id
        # 投稿2のブックマーク
        expect(bookmark2).to be_valid
        expect(bookmark2.errors).to be_empty
        expect(bookmark2.user_id).to eq user.id
        expect(bookmark2.post_id).to eq post2.id
        # 投稿3のブックマーク
        expect(bookmark3).to be_valid
        expect(bookmark3.errors).to be_empty
        expect(bookmark3.user_id).to eq user.id
        expect(bookmark3.post_id).to eq post3.id
        # ブックマークが登録した分だけ確認できる
        expect(user.bookmarks.size).to eq 3
      end
    end
  end
end
