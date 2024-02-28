class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def show
  end

  def new
    @bird = Bird.new
  end
end
