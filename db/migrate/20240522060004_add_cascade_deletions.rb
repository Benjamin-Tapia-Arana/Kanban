class AddCascadeDeletions < ActiveRecord::Migration[7.1]
  def change

    remove_foreign_key :team_users, :teams
    add_foreign_key :team_users, :teams, on_delete: :cascade

    remove_foreign_key :team_users, :users
    add_foreign_key :team_users, :users, on_delete: :cascade

    remove_foreign_key :boards, :teams
    add_foreign_key :boards, :teams, on_delete: :cascade

    remove_foreign_key :cards, :status_lists
    add_foreign_key :cards, :status_lists, on_delete: :cascade

    remove_foreign_key :status_lists, :boards
    add_foreign_key :status_lists, :boards, on_delete: :cascade

  end
end
