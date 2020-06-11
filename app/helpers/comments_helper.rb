module CommentsHelper
  def author_name_of_comment(comment)
    return User.find(comment.user_id).name
  end

  def author_of_comment(comment)
    return User.find(comment.user_id)
  end

  def post_of_comment(comment)
    posts = NewsPost.all

    posts.each do |post|
      if post.id == comment.post_id
        return post
      end
    end
  end

  def comments_to_user(user)
    allPosts = NewsPost.all
    ownPost = Array.new

    allPosts.each do |post|
      if post.author_id == user.id
        ownPost.push post
      end
    end

    allComments = Comment.all
    memberComment = Array.new

    allComments.each do |comment|
      ownPost.each do |post|
        if (comment.post_id == post.id && comment.user_id != user.id)
          memberComment.push comment
        end
      end
    end

    return memberComment
  end


end
