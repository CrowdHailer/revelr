Sequel.migration do
  up do
    create_table :accounts do
      primary_key :guid, :type => :varchar, :auto_increment => false, :unique => true
      Integer :home_phone
      String :home_email 
      Integer :work_phone
      String :work_email
    end
  end

  down do
    drop_table :accounts
  end
end
