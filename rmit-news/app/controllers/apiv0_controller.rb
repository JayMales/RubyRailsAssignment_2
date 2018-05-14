class Apiv0Controller < ApplicationController

  def index

  end

  def show
    begin
      @item = Item.find(params[:id]).to_json
      render plain:  @item
    rescue => ex
      render plain: "{Error: 400 bad request}", :status => :bad_request
    end
  end

  def create
    begin
      item = Item.new(item_params)
      item.user_id = Item.where(username: params[:username]).id
      if params[:type] == "Comment"
        if item.post_id.nil?
          raise "post id required"
        end
        item.type = "Comment"
        item.save
      elsif params[:type] == "News"
        item.type = "Post"
        item.save
      end

    rescue => ex
      render plain: "{Error: 400 bad request}", :status => :bad_request
    end
  end

  private
    def item_params
      if params[:type] == "Comment"
        params.permit(:type, :text, :post_id,:username)
      elsif params[:type] == "News"
        params.permit(:type, :text, :title, :url,:username)
      end
    end
end
