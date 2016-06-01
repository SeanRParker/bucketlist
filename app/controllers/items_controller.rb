class ItemsController < ApplicationController
  before_action :city, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(city_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item_name = @item.name
    @item.destroy
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :complete, :like)
  end

  def item
    @item = Item.find(params[:id])
  end

end
