class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :name
      t.string :username
      t.string :last_name
      t.string :profile_pic
      t.string :cover_pic
      t.date :birth_date
      t.string :gender
      t.text :bio

      t.timestamps
    end
  end
end
