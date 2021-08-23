class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.text :answer
      t.integer :listing_id
      t.integer :buyer_id
      t.boolean :read_by_seller
      t.boolean :answered
      t.boolean :private

      t.timestamps
    end
  end
end
