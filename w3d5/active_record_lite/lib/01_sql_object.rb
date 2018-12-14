require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM 
        #{table_name}
    SQL
    @columns.first.map! { |c| c.to_sym }
  end

  def self.finalize!
    columns.each do |name|
      # self is the class
      define_method("#{name}=") do |arg|
        # now self is the instance
        attributes[name] = arg
      end
      define_method(name) do
        attributes[name] 
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= to_s.tableize #implicit call to instance self
  end

  def self.all
    # results will be an array of hashes
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |options_hash|
      self.new(options_hash)
    end
  end
  
  def self.find(id)
    instance = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    # debugger
    if instance.first.nil?
      nil
    else
      self.new(instance.first.to_h)
    end
  end
  
  def initialize(params = {})
  self.class.finalize!
  # debugger
    params.each do |k, v|
      # debugger
      if !self.class.columns.include?(k.to_sym)
        raise Exception.new("unknown attribute '#{k}'")
      else
        self.send("#{k}=", v)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    values_arr = []
    attributes.each do |k, v|
      values_arr << v
    end
    values_arr
  end

  def insert
    cols = self.class.columns.drop(1).join(",")
    qs = self.class.columns.drop(1).map {|col| col = "?"}.join(",")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{cols})
      VALUES
        (#{qs})
    SQL
    self.id = DBConnection.last_insert_row_id
  end
  
  def update
    coolsies = self.class.columns.map {|col| col = "#{col} = ?"}.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{coolsies}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
# debugger
  end

  def save
    id.nil? ? insert : update
  end

end
