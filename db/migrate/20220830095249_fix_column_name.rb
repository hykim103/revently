class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :restaurants do |t|
      t.rename :type, :venue_type
    end
  end
end
