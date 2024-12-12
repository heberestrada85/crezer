class AddClientInformation < ActiveRecord::Migration[7.2]
  def change

    create_table :clients do |t|
      t.string :name
      t.string :surname
      t.string :second_surname
      t.string :street
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :rfc

      t.timestamps
    end

  end
end
