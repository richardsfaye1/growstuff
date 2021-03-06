class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :owner_id, :null => false
      t.integer :flickr_photo_id, :null => false
      t.string :thumbnail_url, :null => false
      t.string :fullsize_url, :null => false

      t.timestamps
    end
  end
end
