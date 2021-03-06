class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
    @imageable = @title
    @images = @imageable.images
    @image = Image.new
  end

  def new
    @title = Title.new
    #@title.images.build
  end

  def create
    @title = Title.new(params[:title])
    if @title.save
      redirect_to @title, notice: "Successfully created title."
      # if params[:title][:image].present?
      #   render :crop
      # else
      #   redirect_to @title, notice: "Successfully created title."
      # end
    else
      render :new
    end
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
# binding.pry
    if @title.update_attributes(params[:title])
      redirect_to @title, notice: "Successfully updated the title."
      # if params[:title][:image].present?
      #   render :crop
      # else
      #   redirect_to @title, notice: "Successfully updated title."
      # end
    else
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to titles_url, notice: "Successfully destroyed the title."
  end
end
