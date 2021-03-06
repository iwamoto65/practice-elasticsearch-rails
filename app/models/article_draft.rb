# == Schema Information
#
# Table name: article_drafts
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  status      :integer          default("draft"), not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class ArticleDraft < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  scope :draft_status, -> (status) { where(:status => status) }
end
