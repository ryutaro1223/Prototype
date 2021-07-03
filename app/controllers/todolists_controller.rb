class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to '/'
  end

  def index
    @lists = List.all.order("id DESC")
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to '/todolists'
  end

  def destroy
    @list = List.find(params[:id])
    list.destroy
    redirect_to 'todolists'
  end

  private

  def list_params
    params.require(:list).permit(:title, :body)
  end

end
