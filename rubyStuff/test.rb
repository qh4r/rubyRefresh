class Object
  def superclasses(parents = [], level = self)
    level.superclass ? superclasses(parents << level.superclass, level.superclass) : parents
  end
end

class Bar
end

class Foo < Bar
end

Foo.superclasses