class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.string :position, null: false
      t.integer :point, null: false
      t.integer :score, null: false
      t.integer :ranking, null: false

      t.timestamps null: false
    end
  end
end
