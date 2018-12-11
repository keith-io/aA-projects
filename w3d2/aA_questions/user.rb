require 'sqlite3'
require_relative 'questions_database'

class User 

  def self.all
    users = QuestionsDatabase.instance.execute("SELECT * FROM users")
    users.map { |user| User.new(user) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user)
  end

  def self.find_by_fname(fname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
    SQL
    return nil unless user.length > 0

    User.new(user)
  end

  def self.find_by_lname(lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, lname)
      SELECT
        *
      FROM
        users
      WHERE
        lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end 

  def initialize(options = {})
    @id, @fname, @lname = options.values_at('id', 'fname', 'lname')
    # @id = options["id"]
    # @fname = options["fname"]
    # @lname = options["lname"]
  end

  def insert
    raise "#{self} already exists!" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.fname, self.lname)
      INSERT INTO
        users (id, fname, lname)
      VALUES
        (?, ?, ?)
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} doesn't exists!" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.fname, self.lname)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

end