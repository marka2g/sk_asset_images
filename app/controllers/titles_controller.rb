class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(params[:title])
    if @title.save
      if params[:title][:asset_image].present?
        render :crop
      else
        redirect_to @title, notice: "Successfully created title."
      end
    else
      render :new
    end
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
binding.pry
    if @title.update_attributes(params[:title])
      if params[:title][:asset_image].present?
        render :crop
      else
        redirect_to @title, notice: "Successfully updated title."
      end
    else
      render :new
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to titles_url, notice: "Successfully destroyed title."
  end
end
