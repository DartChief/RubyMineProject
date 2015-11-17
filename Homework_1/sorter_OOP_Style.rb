class Person
  attr_accessor :firstname, :lastname, :surname, :login

  def initialize(firstname, lastname, surname, login)
    @firstname, @lastname, @surname, @login = firstname, lastname, surname, login
  end

  def to_s
    return firstname + ', ' + lastname + ', ' + surname + ', ' + login
  end

end

class Sorter

  def read(file)
    lines = File.readlines(file)
  end

  def personality(lines)
    personlist = Array[]
    lines.each do |line|
      newline = line.split(', ')
      person = Person.new(newline[0], newline[1], newline[2], newline[3])
      personlist.push(person.to_s)
    end

    return personlist
  end

  def sort(personlist)
    sortedpersonlist = personlist.sort {|a, b| a <=> b}
  end

  def write(url, collection)
    File.open(url, 'w') do |file|
      collection.each do |c|
        file.puts(c)
      end
    end
  end

end

sorter = Sorter.new

url = 'people.csv'

lines = sorter.read(url)
personlist = sorter.personality(lines)
sortedpersonlist = sorter.sort(personlist)
sorter.write(url, sortedpersonlist)