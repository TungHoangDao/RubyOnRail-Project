class CreateNewsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :news_posts do |t|
      t.string :title
      t.text :content
      t.integer :author_id
      t.datetime :create
      t.integer :total_comment
      t.integer :total_view
      t.string :category

      t.timestamps
    end
  end
end
