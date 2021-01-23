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
    #new_pokemon = self.new(name: name, type: type, db: db)
    p @db = db
    p name
    p type
    saved_pokemon = @db[:conn].execute("SELECT * FROM pokemon WHERE name = ?", name)
    #@db[:conn].execute(sql, self.name, self.type)
    p @id = @db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end