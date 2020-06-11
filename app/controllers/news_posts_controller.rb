class NewsPostsController < ApplicationController

  @@categories = Hash.new
  @@_is_category_fetch = false
  @@category_keys = ""

  @@selected_topic = Array.new
  @@count = 0
  def new
    @post = NewsPost.new()
  end

  def create
    @post = NewsPost.new(news_params)
    @post[:author_id] = session[:user_id]
    @post[:total_comment] = 0
    @post[:total_view] = 0

    if @post.save
      flash[:success] = "Post successfully !"
      redirect_to @post
    else
      render 'new'
    end
  end

  def index
    @posts = NewsPost.all
    @posts = @posts.sort_by(&:updated_at).reverse

    @users = User.take(12)
    @most_view_posts = NewsPost.order("total_view DESC").take(5)

    fetch_category @posts

    @keys = @@category_keys

    @categories = @@categories;


    # render 'index'
  end

  def show
    @current_post = NewsPost.find(params[:id])
    @postComments = total_comments_of_post(@current_post)
    @user = current_user

    @current_post.total_view = @current_post.total_view + 1
    @current_post.total_comment = total_comments_of_post(@current_post).length
    @current_post.save
  end

  private

  def news_params
    params.require(:news_post).permit(:title, :content,
                                 :category)
  end

  def total_comments_of_post(post)
    comments = Comment.all
    postComments = Array.new

    comments.each do |comment|
      if comment.post_id == post.id
        postComments.push comment
      end
    end

    return postComments
  end

  def fetch_category(posts)
    @@category_keys=  ""
    @colCategory = Category.all
    @colCategory.each do |category|
      if category != "News"
        @@category_keys = @@category_keys.length <= 0 ? category.name : @@category_keys + "|" + category.name
      end
    end

      posts.each do |post|
        if post.category != "News"
          if @@categories.key?post.category
            @@categories[post.category].push(post);
          else
            @@categories[post.category] = Array.new
          end
        end
      end
    end
end
