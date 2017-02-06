class AddGifToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :gif, :string
  end
end
