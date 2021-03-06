module TextRazor

  class Topic

    attr_reader :id, :label, :wiki_link, :score

    def initialize(id, label, wiki_link, score)
      @id = id
      @label = label
      @wiki_link = wiki_link
      @score = score
    end

    def self.create_from_hash(params)
      new(params["id"], params["label"], params["wikiLink"], params["score"])
    end

  end

end
