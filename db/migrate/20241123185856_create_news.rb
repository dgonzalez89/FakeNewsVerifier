class CreateNews < ActiveRecord::Migration[7.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.string :moral_category
      t.boolean :result

      t.timestamps
    end
  end
end
