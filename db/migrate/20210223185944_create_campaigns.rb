class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :purpose
      t.integer :duration
      t.references :user

      t.timestamps
    end
  end
end
