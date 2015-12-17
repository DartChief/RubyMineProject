class RemakeMakeFlaggableTable < ActiveRecord::Migration

  def self.up
    create_table :flaggings do |t|
      t.string   :flaggable_type
      t.integer  :flaggable_id
      t.string   :flagger_type
      t.integer  :flagger_id
      t.string   :flag

      t.timestamps
    end

    add_index :flaggings, [:flaggable_type, :flaggable_id]
    add_index :flaggings, [:flag, :flaggable_type, :flaggable_id]
    add_index :flaggings, [:flagger_type, :flagger_id, :flaggable_type, :flaggable_id], :name => "access_flaggings"
    add_index :flaggings, [:flag, :flagger_type, :flagger_id, :flaggable_type, :flaggable_id], :name => "access_flag_flaggings"
  end
end
