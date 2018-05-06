class ItemsController < ApplicationController
  def new
  end

  def newcomments
    @comments = Item.where(type: "Comment").order("id DESC")
  end

  def create
    if params.has_key?(:comment)
      item = Item.new(item_params)
      item.user_id = current_user.id
      item.type = "Comment"
      item.save
      redirect_back(fallback_location: root_path)
    elsif params.has_key?(:post)
      item = Item.new(item_params)
      item.user_id = current_user.id
      item.type = "Post"
      item.save
      redirect_to '/'
    end
  end

  def submit
  end

  def edit
  end

  def index
    @thenews = Item.where(type: "Post")
  end

  def show
    @item = Item.find(params[:id])
  end

  def item_params
    if params.has_key?(:comment)
      params.require(:comment).permit(:text, :post_id)
    elsif params.has_key?(:post)
      params.require(:post).permit(:text, :title, :url)
    end
  end
end
