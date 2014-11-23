Sequel.migration do
  up do
    create_table :accounts do
      primary_key :guid, :type => :varchar, :auto_increment => false, :unique => true
      String :home_telephone
      String :home_email 
      String :work_telephone
      String :work_email
      String :name
    end
  end

  down do
    drop_table :accounts
  end
end
