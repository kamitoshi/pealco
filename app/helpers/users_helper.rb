module UsersHelper

  # alc_categoryがnilの時、「未登録」と表示される
  def favorite_alc_name(user)
    if user.alc_category.nil?
      "未登録"
    else
      user.alc_category.name
    end
  end

  def user_sumnail_image(user)
    if user.image.blank?
      image_tag "no_image.png", :size => "50x50"
    else
      image_tag user.image.thumb50.to_s
    end
  end

  # プロフィール画像が登録されている時といない時の切り替え
  def user_info_image(user)
    if user.image.blank?
      image_tag "no_image.png", :size => "200x200"
    else
      image_tag user.image.thumb300.to_s
    end
  end

end
