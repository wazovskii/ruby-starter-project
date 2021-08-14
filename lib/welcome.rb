class Welcome
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello #{@name}"
  end
end
