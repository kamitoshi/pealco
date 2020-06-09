require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pealco
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # アプリの標準時間を日本時間にする
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local

    # カレンダーの週初めを日曜日に設定
    config.beginning_of_weeks = :sunday

    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # フォーム入力時のエラーを入力フィールド直下に持ってくるための設定
    # config.action_view.field_error_proc = Proc.new do |html_tag, instance|
    #   if instance.kind_of?(ActionView::Helpers::Tags::Label)
    #     # skip when label
    #     html_tag.html_safe
    #   else
    #     "<div class=\".was-validated\">#{html_tag}<span class=\"help-block\">#{instance.error_message.first}</span></div>".html_safe
    #   end
    # end

  end
end

