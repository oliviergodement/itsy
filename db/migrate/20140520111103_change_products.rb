class ChangeProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.references :user
    end
  end
end
