class PostagesController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create,]

  def index
    @postage_form = PostageForm.new
  end

  def create
    @postage_form = PostageForm.new(postage_params)
    if @postage_form.valid?
      pay_item
      @postage_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def postage_params
    params.require(:postage_form).permit(:post_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: postage_params[:token], 
      currency: 'jpy'
    )
  end

  def non_purchased_item

    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.postage.present?
  end
end  
