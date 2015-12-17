 sorted_lines = Array[].push(File.readlines('people.csv').sort { |a, b| a <=> b })
  File.open('people.csv', 'w') do |files|
    sorted_lines.each do |ss|
      files.puts ss
    end
  end