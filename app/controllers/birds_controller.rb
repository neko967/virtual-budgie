class BirdsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def types
    @birds = Bird.all
  end
end
