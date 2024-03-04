class WordsController < ApplicationController
  def create
    @word = Word.new(pet_id: params[:word][:pet_id], word: params[:word][:content])
    learned_words = Pet.find(params[:word][:pet_id]).words

    if learned_words.exists?(word: params[:word][:content])
      learned_words.find_by(word: params[:word][:content]).increase_frequency
    else
      if @word.save
        render json: { status: 'success', message: 'Word saved successfully' }
      else
        render json: { status: 'error', message: 'Failed to save the word' }
      end
    end
  end
end
