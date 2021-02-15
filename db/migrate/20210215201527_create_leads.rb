class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :date_texted

      t.timestamps
    end
  end
end
