class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    @bird = Bird.find(params[:id])
    if @bird.update(bird_params)
      redirect_to @bird
    else
      render :edit
    end
  end

  private

  def bird_params
    params.require(:bird).permit(:bird_type, :description, :bird_image, :bird_image_cache)
  end
end
