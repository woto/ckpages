class CreateCkpagesParts < ActiveRecord::Migration
  def change
    create_table :ckpages_parts do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
