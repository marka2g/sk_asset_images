class ImagesController < ApplicationController
  before_filter :load_attachable

  def index
    @images = @attachable.images
  end

  def new
    @image = @attachable.images.new
  end

  def create
    @image = @attachable.images.new(params[:image])
    if @image.save
      redirect_to @attachable, notice: "Comment created."
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

private

  def load_attachable
    resource, id = request.path.split('/')[1, 2] #/titles/1
    @attachable = resource.singularize.classify.constantize.find(id)
  end

  # alternative option:
  # def load_attachable
  #   klass = [Celeb, Title].detect { |c| params["#{c.name.underscore}_id"] }
  #   @attachable = klass.find(params["#{klass.name.underscore}_id"])
  # end
end