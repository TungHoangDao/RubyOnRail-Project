module NewsPostsHelper
  def author_name_of_post(post)
    return User.find(post.author_id).name
  end

  def author_of_post(post)
    return User.find(post.author_id)
  end


end
