class AddCreatedDateToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :created_date, :date
  end
end
