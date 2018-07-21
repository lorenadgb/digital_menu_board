class AddImagesToScreens < ActiveRecord::Migration[5.1]
  def change
    add_column :screens, :images, :json
  end
end
