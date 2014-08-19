require 'rest_client'

module TextRazor

  class Request

    HTTP_URL = 'http://api.textrazor.com/'
    HTTPS_URL = 'https://api.textrazor.com/'

    OPTIONS_MAPPING = {
      extractors: 'extractors',
      cleanup_html: 'cleanupHTML',
      language: 'languageOverride',
      filter_dbpedia_types: 'entities.filterDbpediaTypes',
      filter_freebase_types: 'entities.filterFreebaseTypes',
      rules: 'rules'
    }

    def self.post(text, options)
      ::RestClient.post url, build_query(text, options), accept_encoding: 'gzip'
    end

    def self.url
      TextRazor.configuration.secure ? HTTPS_URL : HTTP_URL
    end

    private

    def self.build_query(text, options)
      query = {"text" => text, "apiKey" => options.delete(:api_key)}

      options.each do |key, value|
        value = value.join(",") if value.is_a?(Array)
        query[OPTIONS_MAPPING[key]] = value
      end

      query
    end

  end

end
