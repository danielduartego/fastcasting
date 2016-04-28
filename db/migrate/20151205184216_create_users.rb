class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :role
      t.integer :phone_cell
      t.integer :phone_home
      t.string :company_name
      t.string :address
      t.string :city
      t.string :country
      t.string :union
      t.integer :sin
      t.date :birthday
      t.string :gender
      t.string :ethnic_origin
      t.string :nationality
      t.string :hair
      t.string :eyes
      t.float :height
      t.float :weight
      t.float :dress
      t.float :bust
      t.float :waist
      t.float :hips
      t.float :shoe
      t.float :jacket
      t.float :sleeve
      t.float :neck
      t.float :inseam

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
