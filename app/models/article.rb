# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_articles_on_created_at  (created_at)
#
class Article < ApplicationRecord
  include Elasticsearch::ArticleSearchable
end
