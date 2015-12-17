class RebuildMakeFlaggableTable < ActiveRecord::Migration
  def self.down
    remove_index :flaggings, :column => [:flaggable_type, :flaggable_id]
    remove_index :flaggings, :column => [:flag, :flaggable_type, :flaggable_id]
    remove_index :flaggings, :name => "access_flaggings"
    remove_index :flaggings, :name => "access_flag_flaggings"

    drop_table :flaggings
  end
end
