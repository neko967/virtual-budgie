class VocabsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    text = params[:vocab][:text]
    api_key = ENV.fetch('GOO_LAB_API_KEY')
    analysis_result = MorphologicalAnalysisService.analyze(text, api_key)
    vocabs_array = analysis_result['word_list'].flatten(1)
    vocabs_array.delete(["空白", ""])
    learned_vocabs = Pet.find(params[:vocab][:pet_id]).vocabs

    vocabs_array.each do |new_vocab|
      @vocab = Vocab.new(pet_id: params[:vocab][:pet_id], word: new_vocab[1], pos: new_vocab[0])
      vocab_or_nil = learned_vocabs.find_by(word: @vocab.word, pos: @vocab.pos)

      if vocab_or_nil === nil
        @vocab.save
      else
        vocab_or_nil.increase_frequency
      end
    end
  end
end
