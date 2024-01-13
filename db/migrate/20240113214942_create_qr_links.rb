class CreateQrLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :qr_links do |t|
      t.string :name
      t.string :destination_url

      t.timestamps
    end
  end
end
