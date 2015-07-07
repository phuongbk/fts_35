class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

    end

    add_index :users, :email, unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
