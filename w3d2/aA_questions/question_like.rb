require 'sqlite3'
require_relative 'questions_database'

class QuestionLike

  def self.all
    likes = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    likes.map { |like| QuestionLike.new(like) }
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless like.length > 0

    QuestionLike.new(like.first)
  end

  def self.find_by_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    return nil unless likes.length > 0

    QuestionLike.new(likes.first)
  end

  def self.find_by_user_id(user_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        user_id = ?
    SQL
    return nil unless likes.length > 0

    QuestionLike.new(likes.first)  
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
        question_likes (user_id, question_id)
      VALUES
        (?, ?)
    SQL

    self.id = QuestionsDatabase.instance.last_insert_row_id 
  end

  def update
    raise "#{self} doesn't exists!" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.id, self.user_id, self.question_id)
      UPDATE
        question_likes
      SET
        user.id = ?, question_id = ?
      WHERE
        id = ?
    SQL
  end

end