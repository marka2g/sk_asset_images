class CelebsController < ApplicationController
  def index
    @celebs = Celeb.all
  end

  def show
    @celeb = Celeb.find(params[:id])
  end

  def new
    @celeb = Celeb.new
  end

  def edit
    @celeb = Celeb.find(params[:id])
  end

  def create
    @celeb = Celeb.new(params[:celeb])
    if @celeb.save
      redirect_to @celeb, notice: "Celeb was successfully created."
    else
      render :new
    end
  end

  def update
    @celeb = Celeb.find(params[:id])
    if @celeb.update_attributes(params[:celeb])
      redirect_to @celeb, notice: "Celeb was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @celeb = Celeb.find(params[:id])
    @celeb.destroy
    redirect_to celebs_url, notice: "Celeb was destroyed."
  end
end
