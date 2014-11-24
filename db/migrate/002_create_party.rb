Sequel.migration do
  up do
    create_table :parties do
      primary_key :id
      DateTime :start_datetime
      DateTime :finish_datetime
    end
  end

  down do
    drop_table :parties
  end
end
