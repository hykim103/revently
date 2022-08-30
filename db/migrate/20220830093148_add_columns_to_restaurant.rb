class AddColumnsToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :type, :string
    add_column :restaurants, :chairs, :integer
    add_column :restaurants, :max_guests, :integer
    add_column :restaurants, :rating, :float
  end
end
