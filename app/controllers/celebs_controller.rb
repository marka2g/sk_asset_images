class CelebsController < ApplicationController
  def index
    @celebs = Celeb.all
  end

  def show
    @celeb = Celeb.find(params[:id])
    @imageable = @celeb
    @images = @imageable.images
    @image = Image.new
  end

  def new
    @celeb = Celeb.new
    # @celeb.images.build
  end

  def create
    @celeb = Celeb.new(params[:celeb])
    if @celeb.save
      redirect_to @celeb, notice: "Successfully created celeb."
      # if params[:celeb][:image].present?
      #   render :crop
      # else
      #   redirect_to @celeb, notice: "Successfully created celeb."
      # end
    else
      render :new
    end
  end

  def edit
    @celeb = Celeb.find(params[:id])
  end

  def update
    @celeb = Celeb.find(params[:id])
    if @celeb.update_attributes(params[:celeb])
      redirect_to @celeb, notice: "Successfully updated the celeb."
      # if params[:celeb][:image].present?
      #   render :crop
      # else
      #   redirect_to @celeb, notice: "Successfully updated celeb."
      # end
    else
      render :edit
    end
  end

  def destroy
    @celeb = Celeb.find(params[:id])
    @celeb.destroy
    redirect_to titles_url, notice: "Successfully destroyed the title."
  end
end