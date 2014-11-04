class CreateTableLawyerServies < ActiveRecord::Migration
  def change
  	create_table :lawyer_services do |t|
	    t.integer  :lawyer_id
	    t.integer  :service_id
	    t.integer  :charges
	    
	    t.timestamps
	  end

	  add_index :lawyer_services, :lawyer_id
	  add_index :lawyer_services, :service_id

  end
end
