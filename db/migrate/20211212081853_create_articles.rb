class CreateArticles < ActiveRecord::Migration[5.2]
  def up
    create_table :articles do |t|
      t.string :title, :null => false
      t.text   :description
      t.timestamps
    end
  end

  def down
    drop_table :articles do |t|
      t.string :title, :null => false
      t.text   :description
      t.timestamps
    end
  end
end
