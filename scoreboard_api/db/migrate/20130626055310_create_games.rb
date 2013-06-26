class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner, :default => 0

      t.timestamps
    end
  end
end
