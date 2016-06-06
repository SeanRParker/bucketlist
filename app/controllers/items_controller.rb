class ItemsController < ApplicationController
  before_action :list
  before_action :item, except: [:index, :new, :create]


  def index
    @items = @list.items
  end

  def show
  end

  def new
    # item to build off of @list
    @item = Item.new
  end

  def create
    @item = @list.items.create(item_params)
    if @item.save
      redirect_to lists_path(params[:id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to list_item_path(@list, @item)
    else
      render :edit
    end
  end

  def destroy
    # item_name = @item.name
    @item.destroy
    redirect_to list_path(@list)
  end

  private
  def item_params
    params.require(:item).permit(:name, :complete, :like, :image)
  end

  def list
    @list = List.find(params[:list_id])
  end

  def item
    @item = Item.find(params[:id])
  end

end
