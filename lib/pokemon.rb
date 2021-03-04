class Pokemon
attr_accessor :id, :name, :type, :db
    def initialize(
        id:, 
        name:, 
        type:, 
        db:
        )
        @id=id
        @name=name
        @type=type
        @db=db
    end

    def self.save(pokemon_name, pokemon_type, db)
    
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [pokemon_name, pokemon_type])
        
    end

    def self.find(pokemon_id, db)
        array=db.execute("SELECT * FROM pokemon WHERE id = (?)", [pokemon_id]).flatten
        #binding.pry
        Pokemon.new(id:pokemon_id, name:array[1], type:array[2], db:db)
    end

end
