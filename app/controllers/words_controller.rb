class WordsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    text = params[:word][:content]
    api_key = ENV.fetch('GOO_LAB_API_KEY')
    analysis_result = MorphologicalAnalysisService.analyze(text, api_key)
    words_array = analysis_result['word_list'].flatten

    words_array.each do |new_word|
      @word = Word.new(pet_id: params[:word][:pet_id], word: new_word)
      learned_words = Pet.find(params[:word][:pet_id]).words

      if learned_words.exists?(word: new_word)
        learned_words.find_by(word: new_word).increase_frequency
      else
        @word.save
      end
    end
  end
end
