class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username, uniqueness: true, null: false
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
