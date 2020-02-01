class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :wine, null: false, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
