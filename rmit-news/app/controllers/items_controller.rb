class ItemsController < ApplicationController
  def new
  end

  def newcomments
    @comments = Item.where(type: "Comment").order("id DESC")
  end

  def create
    item = Item.new(comment_params)
    item.user_id = current_user.id
    item.type = "Comment"
    item.save
    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @thenews = Item.where(type: "Post")
  end

  def show
    @item = Item.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
