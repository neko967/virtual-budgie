class WordsController < ApplicationController
  def create
    @word = Word.new(pet_id: params[:word][:pet_id], word: params[:word][:content])
    if @word.save
      render json: { status: 'success', message: 'Word saved successfully' }
    else
      render json: { status: 'error', message: 'Failed to save the word' }
    end
  end
end
