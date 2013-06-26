class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      t.integer :game_id
      t.integer :player
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
