class CreateSurvey < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
