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
    p name
    p type
    p db
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    @db[:conn].execute(sql, self.name, self.type)
    @id = @db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end