class Article < ApplicationRecord
  include Elasticsearch::ArticleSearchable
end
