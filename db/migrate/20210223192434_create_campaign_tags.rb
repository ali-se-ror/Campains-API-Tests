class CreateCampaignTags < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_tags do |t|
      t.references :campaign, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
