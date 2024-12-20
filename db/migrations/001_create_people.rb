Sequel.migration do
  change do
    create_table(:people) do
      primary_key :id
      String :first_name, null: false
      String :last_name, null: false
    end
  end
end