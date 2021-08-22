class CreateApplicates < ActiveRecord::Migration[6.1]
  def change
    create_table :applicates do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :email
      t.string :phone
      t.string :address
      t.string :education
      t.belongs_to :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
