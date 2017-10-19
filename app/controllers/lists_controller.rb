class ListsController < ApplicationController
  before_action :set_list, :only =>[:show,:edit,:update,:destroy]
  def index
    @lists = List.all.order(date: :desc)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    if @list.date.past?
      flash[:alert] = "this is out of date!"
    else
      @list.destroy
    end
    redirect_to lists_url
  end

  private
  def list_params
    params.require(:list).permit(:todo,:date,:description)
  end
  def set_list
    @list=List.find(params[:id])
  end

end
