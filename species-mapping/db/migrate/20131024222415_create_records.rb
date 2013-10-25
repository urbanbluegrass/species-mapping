class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
