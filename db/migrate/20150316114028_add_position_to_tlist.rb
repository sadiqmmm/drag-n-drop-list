class AddPositionToTlist < ActiveRecord::Migration
  def change
    add_column :tlists, :position, :integer
  end
end
