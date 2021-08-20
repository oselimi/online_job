class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :category
      t.datetime :deadline
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
