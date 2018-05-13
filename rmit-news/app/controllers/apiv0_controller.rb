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

  end
end
