class ApplicationController < ActionController::Base
  before_action :ransack

  # renderer.renderのエラー対策
  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  def ransack
    @user_search = User.ransack(params[:q])
    @users = @user_search.result.page(params[:page]).per(30)
    @post_search = Post.ransack(params[:q])
    @posts = @post_search.result.page(params[:page]).order(created_at: :desc).per(15)
  end

end
