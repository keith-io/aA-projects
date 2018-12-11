require 'byebug'
require_relative 'questions_database'

class Question

  attr_accessor :title, :body, :author_id

  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end
  
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM
    questions
    WHERE
    id = ?
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end
  
  def self.find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
    SELECT
    *
    FROM
    questions
    WHERE
    title = ?
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end
  
  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
    *
    FROM
    questions
    WHERE
    author_id = ?
    SQL
    return nil unless question.length > 0
    
    Question.new(question.first)
  end

  def initialize(options)
    # debugger
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @author_id = options["author_id"]
  end
  
  def author
    User.find_by_id(self.author_id)
  end

  def insert
    raise "#{self} already exists!" if self.id

    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.title, self.author_id)
      INSERT INTO
        questions (id, title, author_id)
      VALUES
      (?, ?, ?)
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} doesn't exist!" unless self.id

    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.author_id)
      UPDATE
        questions
      SET
        title = ?, body = ?, author_id = ?
      WHERE
        id = ?
    SQL
  end
end