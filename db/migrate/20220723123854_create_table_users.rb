class CreateTableUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :table_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_author

      t.timestamps
    end
  end
end
