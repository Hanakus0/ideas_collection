RSpec.describe "/users/auth/google_oauth2/callback", type: :request do
  describe 'GET|POST user_google_oauth2_omniauth_callback_path' do
    let(:google_user) { create(:google_user) }

    before do
      # https://github.com/omniauth/omniauth/wiki/Integration-Testing
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
      # メール認証のスキップ
      google_user.confirm
      # 認証のパス
      get '/users/auth/google_oauth2/callback', params: { provider: "google_oauth2" }
    end
    it 'レスポンスでHTTPメッセージ302を返すこと' do
      expect(response).to have_http_status(302)
    end
  end
end
