class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  
  def self.save(name, breed, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, breed)
  end
  
  def self.find(id, db)
    values = db.execute("SELECT * FROM Pokemon WHERE id=?", id)[0]
    binding.pry
    hash = {id: values[0], name: values[1], type: values[2], hp: values[3], db: db}
    Pokemon.new(hash)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE Pokemon SET hp=? WHERE id=?", hp, @id)
  end
end
