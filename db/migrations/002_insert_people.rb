Sequel.migration do
  up do
    from(:people).insert(id: 1, first_name: 'George', last_name: 'Harrison')
    from(:people).insert(id: 2, first_name: 'John', last_name: 'Lennon')
    from(:people).insert(id: 3, first_name: 'Paul', last_name: 'McCartney')
    from(:people).insert(id: 4, first_name: 'Ringo', last_name: 'Starr')
  end

  down do
    from(:people).delete
  end
end