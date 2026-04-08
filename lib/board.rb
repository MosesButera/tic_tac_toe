class People
  @@rows = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]

  def table(array_rows)
    sep = '+--------+--------+'
    puts sep
    array_rows.map do |r|
      puts "|  #{r.each { |element| element.to_s.ljust(4) }.join('  |  ')}  |"
      puts sep
    end
  end

  def self.class_variable
    @@rows
  end
end
