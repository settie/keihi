class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :length_type, null: false, default: 'half'

      t.timestamps null: false
    end
  end
end
