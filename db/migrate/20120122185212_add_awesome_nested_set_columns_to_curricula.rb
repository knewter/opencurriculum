class AddAwesomeNestedSetColumnsToCurricula < ActiveRecord::Migration
  def change
    add_column :curricula, :parent_id, :integer
    add_column :curricula, :lft, :integer
    add_column :curricula, :rgt, :integer
    add_column :curricula, :depth, :integer
  end
end
