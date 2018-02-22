class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :discount
      t.datetime :expire_date

      t.timestamps
    end
  end
end
