module Elasticsearch::ArticleSearchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :id, type: 'integer'
        indexes :title, type: 'text', analyzer: 'english', index_options: 'offsets'
        indexes :description, type: 'text', analyzer: 'english'
      end
    end
  end

  module ClassMethods
    def search_document(title = nil)
      if title.present?
        title_keyword_query = match_title_query(title)
        __elasticsearch__.search(title_keyword_query)
      else
        __elasticsearch__.search(match_all_query)
      end
    end

    private

    def match_title_query(title)
      {
        query: {
          query_string: {
            query: "*#{title}*",
            fields: [
              "title"
            ]
          }
        }
      }
    end

    def match_all_query
      {
        query: {
          match_all: {}
        },
        size: 50,
        sort: {
          "id": "desc"
        }
      }
    end
  end
end
