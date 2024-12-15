Capybara.register_driver :remote_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  # セキュリティ対策などのchromeに搭載してある保護機能をオフにする
  options.add_argument('--no-sandbox')
  # コマンドラインからchromeを開く
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
   # ディスクのメモリスペースを使う
  options.add_argument('--disable-dev-shm-usage')
  # chromeのウィンドウサイズ
  options.add_argument('--window-size=1440,990')
  Capybara::Selenium::Driver.new(app, browser: :remote, url: ENV['SELENIUM_DRIVER_URL'], capabilities: options)
end
