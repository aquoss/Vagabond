class AddPostReferenceToCity < ActiveRecord::Migration[5.0]
  def change
    add_reference :cities, :post, foreign_key: true
  end
end
