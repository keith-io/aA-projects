require 'sqlite3'
require_relative 'questions_database'

class Reply

  def self.all
    replies = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_parent_id(parent_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_author_id(author_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options["id"]
    @body = options["body"]
    @question_id = options["question_id"]
    @parent_id = options["parent_id"]
    @author_id = options["author_id"]   
  end

  def insert
    raise "#{self} already exists!" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.body, self.question_id, self.parent_id, self.author_id)
      INSERT INTO
        replies (id, body, question_id, parent_id, author_id)
      VALUES
        (?, ?, ?, ?, ?)
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} doesn't exists!" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.body, self.question_id, self.parent_id, self.author_id)
      UPDATE
        replies 
      SET
        id = ?, body = ?, question_id = ?, parent_id = ?, author_id = ?
    SQL
  end
end