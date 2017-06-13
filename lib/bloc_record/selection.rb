require 'sqlite3'

module Selection
  def find(id)
    row = connection.get_first_row <<-SQL
      SELECT #{columns.join ","} FROM #{table}
      WHERE id = #{id};
    SQL

    data = Hash[columns.zip(row)]
    new(data)
  end

  def find_by(attribute, value)
    value = BlocRecord::Utility.sql_strings(value)
    rows = connection.execute <<-SQL
      SELECT #{columns.join ","} FROM #{table}
      WHERE #{attribute} = #{value};
    SQL

    rows.each do |row|
      data = Hash[columns.zip(row)]
      new(data)
    end
  end
end
