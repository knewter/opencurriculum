class CreateCurricula < ActiveRecord::Migration
  def change
    create_table :curricula do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
