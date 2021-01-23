class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name:, type:, id: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    #@db = db
    
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    #new_pokemon = self.new(name: name, type: type, db: db)
  
    #saved_pokemon = @db[:conn].execute("SELECT * FROM pokemon WHERE name = ?", name)
    p @id = db[:conn].execute("SELECT id FROM pokemon WHERE name = ?", name)
    
  end

end