class CreateAnswersPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :answers_posts do |t|
      t.belongs_to :answer, null: false
      t.belongs_to :post, null: false
      t.timestamps
    end
  end
end
