class AddLinksToVerses < ActiveRecord::Migration
  def change
    add_column :verses, :maplink, :string
    add_column :verses, :imagelink, :string
  end
end
