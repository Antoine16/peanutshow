class CreateBorrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowers do |t|
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
