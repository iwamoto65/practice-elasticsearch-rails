# == Schema Information
#
# Table name: draft_articles
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  status      :integer          default("draft"), not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class DraftArticle < ApplicationRecord
  enum status: { draft: 0, published: 1 }
end
