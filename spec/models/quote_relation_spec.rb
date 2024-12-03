require 'rails_helper'

RSpec.describe QuoteRelation, type: :model do
  describe '[Model : QuoteRelation] 引用投稿の確認' do
    # ユーザー
    # let(:correct_user) { create(:correct_user) }
    # ポストジャンル関連
    let(:post_genre) { create(:post_genre) }
    let(:genre_tech) { create(:genre_tech) }
    # 適切な投稿
    let(:post) { create(:post, post_genre: post_genre) }
    let(:quoted_post) { create(:post, post_genre: genre_tech) }
    let(:quote_relation) { build(:quote_relation, post: post, quote_post: quoted_post) }
    let(:self_quote_relation) { build(:quote_relation, post: post, quote_post: post) }

    # TEST
    context '投稿Aが投稿Bを引用投稿する際、' do
      it '引用投稿レコードが生成される' do
        expect(quote_relation).to be_valid
        expect(quote_relation.errors).to be_empty
        # 外部キーの確認
        expect(quote_relation.post_id).to eq post.id
        expect(quote_relation.quote_post_id).to eq quoted_post.id
      end
    end
    context '投稿Aがそれ自身を引用投稿する際、' do
      it '引用投稿レコードが生成される' do
        expect(self_quote_relation).to be_valid
        expect(self_quote_relation.errors).to be_empty
        # 外部キーの確認
        expect(self_quote_relation.post_id).to eq post.id
        expect(self_quote_relation.quote_post_id).to eq post.id
      end
    end
  end
end
