class CreateDraftArticles < ActiveRecord::Migration[6.1]
  def up
    create_table :draft_articles do |t|
      t.string :title, :null => false
      t.text   :description
      t.integer :status, :default => 0, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :draft_articles do |t|
      t.string :title, :null => false
      t.text   :description
      t.integer :status, :default => 0, :null => false
      t.timestamps
    end
  end
end
