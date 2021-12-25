class ChangeDraftArticleTableName < ActiveRecord::Migration[6.1]
  def up
    rename_table :draft_articles, :article_drafts
  end

  def down
    rename_table :article_drafts, :draft_article
  end
end
