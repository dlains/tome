class AddPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.string :slug, null: false
      t.text :summary
      t.text :content
      t.boolean :published, default: false
      t.datetime :published_at

      t.timestamps
    end

    add_index :posts, :slug, unique: true
    add_index :posts, :published_at
  end
end
