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
      image_tag "no-image.png", :size => "300x200", id: "img_prev"
    else
      image_tag post.image.thumb300.to_s, id: "img_prev"
    end
  end

  # ジャンル検索のタイトル表示の変更用
  def category_name(category)
    if category.nil?
      全ジャンル
    else
      category.name
    end
  end

  # 評価の平均値を出すための数値の配列生成
  def rates(reviews)
    rates = []
    reviews.each do |review|
      rates.push(review.rating)
    end
    return rates
  end

  # 評価の平均値を出すため
  def average(array)
    sum = 0
    array.each do |num|
      sum += num
    end
    return ave = sum / array.length
  end

end
