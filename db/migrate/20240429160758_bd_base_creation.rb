class BdBaseCreation < ActiveRecord::Migration[7.1]
  def change

    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :full_name

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end

    create_table :team_users do |t|
      t.references :team, foreign_key: {to_table: :teams}
      t.references :user, foreign_key: {to_table: :users}

      t.timestamps
    end

    create_table :boards do |t|
      t.string :title
      t.references :creator, foreign_key: {to_table: :users}
      t.references :team, foreign_key: {to_table: :teams}

      t.timestamps
    end

    create_table :status_lists do |t|
      t.string :title
      t.references :board, foreign_key: {to_table: :boards}

      t.timestamps
    end

    create_table :cards do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.references :creator, foreign_key: {to_table: :users}
      t.references :assignee, foreign_key: {to_table: :users}
      t.references :status_list, foreign_key: {to_table: :status_lists}

      t.timestamps
    end

  end
end

