class CreateStaticPages < ActiveRecord::Migration[5.1]
  def change
    create_table :static_pages do |t|
      t.string :name
      t.string :permalink
      t.text :content

      t.timestamps
    end
    add_index :static_pages, :permalink
  end
end
