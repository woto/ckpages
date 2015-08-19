class AddColumnsToCkpagesUploads < ActiveRecord::Migration
  def change
    rename_column :ckpages_uploads, :image, :file
    add_column :ckpages_uploads, :content_type, :string
    add_column :ckpages_uploads, :file_size, :integer
  end
end
