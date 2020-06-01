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

  # フォローしている場合は表示
  def follow_status(user)
    unless current_user == user
      if current_user.follow?(user)
        "フォロー中"
      end
    end
  end

  # チャット相手の名前を表示
  def communication_user_name(users)
    users.each do |user|
      unless user.name == current_user.name
        return user.name
      end
    end
  end

  # チャット相手の情報を表示
  def communication_user(users)
    users.each do |user|
      unless user == current_user
        return user
      end
    end
  end

  # 本日のスケジュールをとってくる
  def today_schedule(schedule)
    if schedule.start_date.to_date == Date.today
      schedule.title
    end
  end

end
