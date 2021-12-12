class Article < ApplicationRecord
  include Elasticsearch::Model

  settings index: { number_of_shards: 3 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :description, analyzer: 'english'
    end
  end
end
