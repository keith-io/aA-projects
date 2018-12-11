require 'sqlite3'
require_relative 'questions_database'

class QuestionFollow

  def self.all
    follows = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    follows.map { |follow| QuestionFollow.new(follow) }
  end

  def self.find_by_id(id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless follow.length > 0

    QuestionFollow.new(follow.first)
  end

  def self.find_by_user_id(user_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL
    return nil unless follow.length > 0

    QuestionFollow.new(follow.first)
  end

  def self.find_by_question_id(question_id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions_follows
      WHERE
        question_id = ?
    SQL
    return nil unless follow.length > 0

    QuestionFollow.new(follow.first)
  end

  def initialize(options)
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end

  def insert
    raise "#{self} already exists!" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.user_id, self.question_id)
      INSERT INTO
        question_follows (id, user_id, question_id)
      VALUES
        (?, ?, ?)
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} doesn't exists!" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.user_id, self.question_id)
      UPDATE
        question_follows
      SET
        user_id = ?, question_id = ?
      WHERE
        id = ?
    SQL
  end
end