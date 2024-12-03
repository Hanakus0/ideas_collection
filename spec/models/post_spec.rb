require 'rails_helper'

RSpec.describe Post, type: :model do
  # Success
  # ユーザー
  let(:correct_user) { create(:correct_user) }
  # ポストジャンル関連
  let(:post_genre) { create(:post_genre) }
  # 適切な投稿
  let(:correct_post) { build(:post, post_genre: post_genre) }
  # タグ関連
  let(:tags) { create_list(:tag, 5) }
  # 適切な画像ファイル
  let(:correct_file1) { fixture_file_upload(Rails.root.join('spec/support/app_logo.png'), 'image/png') }
  let(:correct_file2) { fixture_file_upload(Rails.root.join('spec/support/kat.jpg'), 'image/jpg') }
  let(:correct_file3) { fixture_file_upload(Rails.root.join('spec/support/spec.jpeg'), 'image/jpeg') }

  # ERROR
  # 不適切な入力内容の投稿
  let(:no_title_post) { build(:no_title_post, post_genre: post_genre) }
  let(:no_content_post) { build(:no_content_post, post_genre: post_genre) }
  let(:correct_file4) { fixture_file_upload(Rails.root.join('spec/support/cc.png'), 'image/png') }
  # 不適切な画像ファイル
  let(:incorrect_file) { fixture_file_upload(Rails.root.join('spec/support/pg.webp'), 'image/webp') }
  # TEST Success
  describe '[Model : Post] Success - バリデーションの確認' do
    context '適切な投稿内容で新規登録する場合、' do
      it 'エラー無く投稿できる' do
        correct_post.save
        # 画像を3枚追加すると想定
        correct_post.images = [ correct_file1, correct_file2, correct_file3 ]
        # タグを追加
        correct_post.tags << tags

        expect(correct_post).to be_valid
        expect(correct_post.errors).to be_empty
        expect(correct_post.post_genre_id).to eq "funny"
        expect(correct_post.title).to eq 'title'
        expect(correct_post.content.length).to eq 500
        expect(correct_post.images.size).to eq 3
        expect(correct_post.tags.size).to eq 5
        expect(correct_post.draft_flg).to eq "publish"
      end
      it '投稿ステータスを"下書き"しても投稿できる' do
        correct_post.draft_flg = 1
        correct_post.save
        expect(correct_post.draft_flg).to eq "draft"
      end
      it '必須項目ではない項目は未入力でも投稿できる' do
        correct_post.save

        expect(correct_post).to be_valid
        expect(correct_post.errors).to be_empty
        expect(correct_post.post_genre_id).to eq "funny"
        expect(correct_post.title).to eq 'title'
        expect(correct_post.content.length).to eq 500
        expect(correct_post.images).to be_empty
        expect(correct_post.tags).to be_empty
        expect(correct_post.draft_flg).to eq "publish"
      end
      it '必須項目ではないタグを未入力でも投稿できる' do
        correct_post.save
        # 画像を3枚追加すると想定
        correct_post.images = [ correct_file1, correct_file2, correct_file3 ]

        expect(correct_post).to be_valid
        expect(correct_post.errors).to be_empty
        expect(correct_post.post_genre_id).to eq "funny"
        expect(correct_post.title).to eq 'title'
        expect(correct_post.content.length).to eq 500
        expect(correct_post.images.size).to eq 3
        expect(correct_post.tags).to be_empty
        expect(correct_post.draft_flg).to eq "publish"
      end
      it '必須項目ではない画像を未入力でも投稿できる' do
        correct_post.save
        # タグを追加
        correct_post.tags << tags

        expect(correct_post).to be_valid
        expect(correct_post.errors).to be_empty
        expect(correct_post.post_genre_id).to eq "funny"
        expect(correct_post.title).to eq 'title'
        expect(correct_post.content.length).to eq 500
        expect(correct_post.images).to be_empty
        expect(correct_post.tags.size).to eq 5
        expect(correct_post.draft_flg).to eq "publish"
      end
    end
  end

  # Error
  describe '[Model : Post] Error - バリデーションの確認' do
    context '不適切な投稿内容で新規登録する場合、' do
      it 'タイトルが未入力の場合バリデーションエラーが発生する' do
        no_title_post.save
        expect(no_title_post).to be_invalid
        expect(no_title_post.errors).to be_present
        expect(no_title_post.title).to be_empty
      end
      it '投稿本文が未入力の場合バリデーションエラーが発生する' do
        no_content_post.save
        expect(no_content_post).to be_invalid
        expect(no_content_post.errors).to be_present
        expect(no_content_post.content).to be_empty
      end
    end
    context '不適切な画像ファイルで新規登録する場合、' do
      it '画像の拡張子のバリデーションエラーが発生する' do
        correct_post.images = [ incorrect_file ]
        correct_post.save
        expect(correct_post).to be_invalid
        expect(correct_post.errors).to be_present
        expect(correct_post.errors[:images][0]).to include("jpg jpeg png 以外は投稿できません")
        expect(correct_post.images).to be_empty
      end
      it '画像が３枚より多く添付されたためバリデーションエラーが発生する' do
        correct_post.images = [ correct_file1, correct_file2, correct_file3, correct_file4 ]
        correct_post.save
        expect(correct_post).to be_invalid
        expect(correct_post.errors).to be_present
        expect(correct_post.errors[:images][0]).to include("3 枚以内にしてください")
      end
    end
  end
end
