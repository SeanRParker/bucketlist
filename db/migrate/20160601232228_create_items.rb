class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :complete
      t.boolean :like
      t.belongs_to :list

      t.timestamps null: false
    end
  end
end
