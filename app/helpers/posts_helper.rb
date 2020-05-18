module PostsHelper

  def post_sumnail_image(post)
    if post.image.blank?
      image_tag "no-image.png", :size => "50x50"
    else
      image_tag post.image.thumb50.to_s
    end
  end

  def post_show_image(post)
    if post.image.blank?
      image_tag "no-image.png", :size => "300x200"
    else
      image_tag post.image.thumb300.to_s
    end
  end

end
