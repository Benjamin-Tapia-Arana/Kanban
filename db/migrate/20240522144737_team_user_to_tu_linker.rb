class TeamUserToTuLinker < ActiveRecord::Migration[7.1]
  def change
    rename_table :team_users, :tu_linkers
  end
end
