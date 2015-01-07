class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :author
      t.date :trending_on

      t.timestamps
    end
  end
end
