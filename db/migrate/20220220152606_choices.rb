class Choices < ActiveRecord::Migration[5.2]
  def change
    drop_table :choices
  end
end
