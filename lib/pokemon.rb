class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name:, type:, id: nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def 

  def self.save
    #new_pokemon = self.new(name: name, type: type, db: db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.type)
    #@id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end