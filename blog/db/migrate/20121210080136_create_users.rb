class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date :date_of_birth
      t.password :string
      t.string :profile_pic

      t.timestamps
    end
  end
end
