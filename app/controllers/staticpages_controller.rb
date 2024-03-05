class StaticpagesController < ApplicationController
  def top
    @pets = Pet.all
  end
end
