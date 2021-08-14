class CreateNoEtaAnalysis < ActiveRecord::Migration[6.1]
  def change
    create_table :containers_missing_etas , force: :cascade do |t|
      t.string :container_id
      t.boolean :finished_journey
      t.boolean :milestone_exists
      t.boolean :eta_available
      
      
      
      

    end


  end
end
