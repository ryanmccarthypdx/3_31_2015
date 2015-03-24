class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :user_id
      t.integer :question_id
      t.boolean :best?
      t.integer :score
    end
  end
end
