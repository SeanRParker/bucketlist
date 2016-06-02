class ListsController < ApplicationController
  before_action :
  def index
  	@lists = List.all
  end

  def show
  end

  def edit
  end

  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
  		redirect_to list_path(@list)
  	else
  		render :new
  	end
  end

  def update
  	if @list.update(list_params)
  		redirect_to list_path(@list)
  	else
  		render :edit
  	end
  end

  def destroy

  end

  private

  def list_params
  	params.require(:list).permit(:name, :description)
  end

  def list
  	@list = List.find(params[:id])
  end
end
