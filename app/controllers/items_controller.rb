class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end
  
end
