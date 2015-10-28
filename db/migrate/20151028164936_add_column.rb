class AddColumn < ActiveRecord::Migration
	def change #to add column
	    add_column :urls, #add to urls table
	    :click_count, :integer, :default => 0
	end
end
