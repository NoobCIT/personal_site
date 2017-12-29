class AddPaperclipFieldsToStaticPage < ActiveRecord::Migration[5.1]
  def change
    add_column :static_pages, :image_file_name,    :string
    add_column :static_pages, :image_content_type, :string
    add_column :static_pages, :image_file_size,    :integer
    add_column :static_pages, :image_updated_at,   :datetime
  end
end
