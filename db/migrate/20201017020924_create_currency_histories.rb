class CreateCurrencyHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_histories do |t|
      t.string :currencyName
      t.float :currencyAmount
      t.string :convertedName
      t.float :convertedAmount
      t.date :convertedDate

      t.timestamps
    end
  end
end


params.require(:currency_history).permit(:currencyName, :currencyAmount, 
:convertedName, :convertedAmount, :convertedDate)
