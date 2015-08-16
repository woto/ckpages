class CreateCkpagesUploads < ActiveRecord::Migration
  def change
    create_table :ckpages_uploads do |t|
      t.string :file
      t.string :content_type
      t.integer :file_size

      t.timestamps null: false
    end
  end
end
