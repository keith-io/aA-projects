class ValidateArtwork < ActiveRecord::Migration[5.2]
  def change
      change_column :artworks, :title, :string, null: false
  end
end
