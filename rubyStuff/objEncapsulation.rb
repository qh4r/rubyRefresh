class Person
  #gettery i settery potrzebuja @pol wspierajacych
  # attr_reader :name
  attr_reader :reversed_name

  # metoda zamiast getera metody z = i bez niego moga wspolistniec
  def name
    @name
  end

  def name=(name)
    if name.is_a?(String)
      #pole bez akcesora jest prywatne
      @name = name.upcase
      @reversed_name = @name.reverse
    end
  end

  private
  attr_writer :reversed_name
end


p = Person.new


p.name = 'rafał'
p p.name

p p.reversed_name