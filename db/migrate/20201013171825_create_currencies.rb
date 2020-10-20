class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :currencyName
      t.float :currencyAmount
      t.string :convertedName
      t.float :convertedAmount
      t.float :rate
      t.belongs_to :user

      t.timestamps
    end
  end
end

