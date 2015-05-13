class ChangePositionColumnTypeToInteger < ActiveRecord::Migration
  # XXX だいぶ雑な実装、最初だしいいかなって思った

  def up
    remove_column :results, :position
    add_column :results, :position, :integer, null: false
  end

  def down
    remove_column :results, :position
    add_column :results, :position, :string, null: false
  end
end
