class CreateCurrencyHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_histories do |t|
      t.string :currencyName
      t.float :currencyAmount
      t.string :convertedName
      t.float :convertedAmount
      t.date :convertedDate
      t.belongs_to :user

      t.timestamps
    end
  end
end


