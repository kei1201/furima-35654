class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path,only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    unless @item.order.nil?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def move_to_root_path
    redirect_to root_path if current_user.id != @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image
    ).merge(user_id: current_user.id)
  end
end