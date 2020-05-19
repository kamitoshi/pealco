module LikesHelper

  # お気に入りのボタン切り替えのために生成　→　like_btnパーシャルに使用
  def like_toggle(user, post, like)
    if like.nil?
      link_to "お気に入りに追加する", post_likes_path(post),method: :post,remote: true, class:"btn btn-success"
    else
      link_to "お気に入りから外す", post_like_path(post, like), method: :delete,remote: true, class:"btn btn-danger"
    end
  end

end
