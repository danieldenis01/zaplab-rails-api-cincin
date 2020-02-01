class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string     :name, limit: 100, null: false
      t.decimal    :price, precision: 10, scale: 2
      t.boolean    :available, default: false
      t.references :manufactory_by, null: false, foreign_key: { to_table: :wineries }

      t.timestamps
    end
  end
end
