class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :guest, null: false, foreign_key: true, on_delete: :cascade
      t.string :code, null: false, index: { unique: true }
      t.date :start_date
      t.date :end_date
      t.integer :nights, default: 0
      t.jsonb :guests, null: false, default: {}
      t.integer :status, default: 0
      t.string :currency, null: false, default: 'AUD'
      t.jsonb :price, null: false, default: {}
      t.timestamps
    end
  end
end

