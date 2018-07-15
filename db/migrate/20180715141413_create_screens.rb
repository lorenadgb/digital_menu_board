class CreateScreens < ActiveRecord::Migration[5.1]
  def change
    create_table :screens do |t|
      t.string     :name
      t.integer    :interval
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
