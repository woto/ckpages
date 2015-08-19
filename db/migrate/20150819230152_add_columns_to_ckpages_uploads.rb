class AddColumnsToCkpagesUploads < ActiveRecord::Migration
  def change
    add_column :ckpages_uploads, :file, :string
    add_column :ckpages_uploads, :content_type, :string
    add_column :ckpages_uploads, :file_size, :integer
  end
end
