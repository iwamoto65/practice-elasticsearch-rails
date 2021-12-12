class AddIndexToArticles < ActiveRecord::Migration[5.2]
  def up
    add_index(:articles, :created_at, order: :desc)
  end

  def down
    remove_index(:articles, :created_at, order: :desc)
  end
end
