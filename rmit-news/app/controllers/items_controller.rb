class ItemsController < ApplicationController

  # rails g controller items new newcomments submit index show
  # This controlleris used for items, a single table inheritance
  # It is used to view posts and comments, create them and yeah that's'
  # it

  def new
  end

  # Gets list of comments from newest to oldest
  def newcomments
    @comments = Item.where(type: "Comment").order("id DESC")
  end

  # Most of the data is sent from the form but some has to be added in
  # Like type and user id from the session. Then it was saved
  def create
    item = Item.new(item_params)
    item.user_id = current_user.id
    if params.has_key?(:comment)
      item.type = "Comment"
      item.save
      redirect_back(fallback_location: root_path)
    elsif params.has_key?(:post)
      item.type = "Post"
      item.save
      redirect_to '/'
    end
  end

  def submit
  end

  # Gets list of posts from newest to oldest
  def index
    @page = 0
    if params.has_key?(:p)
      @page = params[:p]
    end
    @prevpage = @page.to_i-1
    @nextpage = @page.to_i+1
    offset = @page*2
    @thenews = Item.where(type: "Post").order("id DESC").limit(10).offset(offset)

    if @thenews.count < 10
      @nextpage = nil
    end
    if @prevpage < 0
      @prevpage = nil
    end
  end

  # Finds the id of the the post which is requested in get
  def show
    @item = Item.find(params[:id])
  end

  # Tells which params should be accepted so they dont break the database
  private
    def item_params
      if params.has_key?(:comment)
        params.require(:comment).permit(:text, :post_id)
      elsif params.has_key?(:post)
        params.require(:post).permit(:text, :title, :url)
      end
    end
end
