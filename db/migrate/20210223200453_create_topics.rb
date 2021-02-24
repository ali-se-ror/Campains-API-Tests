class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :user, foreign_key: true
      t.references :campaign, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
