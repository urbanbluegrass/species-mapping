class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :author
      t.text :body
      t.references :record, index: true

      t.timestamps
    end
  end
end
