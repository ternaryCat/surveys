class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :title, null: false
      t.string :description, null: false

      t.belongs_to :survey, null: false
      t.timestamps
    end
  end
end
