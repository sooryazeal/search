class CreateTableLawyers < ActiveRecord::Migration
  def change
  	create_table :lawyers do |t|
      t.integer     :experience
      t.string      :name
      t.string      :code
      t.string      :location
      t.float		:rating

      t.timestamps
  end
  end
end
