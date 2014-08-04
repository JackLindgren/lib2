class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :language
      t.string :year
      t.string :subject
      t.references :author, index: true

      t.timestamps
    end
  end
end
