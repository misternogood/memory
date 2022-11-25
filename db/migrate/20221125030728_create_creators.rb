class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :name,        null: false
      t.date :birth_date,    null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
