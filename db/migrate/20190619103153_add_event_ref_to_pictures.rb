class AddEventRefToPictures < ActiveRecord::Migration[5.2]
  def change
    add_reference :pictures, :event, foreign_key: true
  end
end
