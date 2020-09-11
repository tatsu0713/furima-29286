class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    if @item.valid?
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :item_status_id, :item_burden_id, :delivery_area_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
