class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
