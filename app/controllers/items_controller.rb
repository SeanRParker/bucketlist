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
    # item build off of list
    @item = @list.items.create(item_params)
    if @item.save
      redirect_to list_item_path(@list, @item)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
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

  def list
    @list = List.find(params[:list_id])
  end

  def item
    @item = Item.find(params[:id])
  end

end
