class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :title, null: false
      t.integer :weight, null: false

      t.belongs_to :question, null: false
      t.belongs_to :answer, null: false
      t.timestamps
    end
  end
end
