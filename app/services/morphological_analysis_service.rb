require 'httparty'

class MorphologicalAnalysisService
  include HTTParty
  base_uri 'https://labs.goo.ne.jp/api/morph'

  def self.analyze(text, app_id)
    body = {
      app_id: app_id,
      sentence: text,
      info_filter: 'pos|read',
    }.to_json

    headers = {
      'Content-Type' => 'application/json'
    }

    response = post('/', body: body, headers: headers)
    response.parsed_response
  end
end
