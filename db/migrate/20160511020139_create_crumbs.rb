class CreateCrumbs < ActiveRecord::Migration
  def change
    create_table :crumbs do |t|
      t.string :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
