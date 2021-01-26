class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title, null: false

      t.belongs_to :survey, null: false
      t.timestamps
    end
  end
end
