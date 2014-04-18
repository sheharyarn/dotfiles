## Class Overrides
## ===============


class Object
  # Search methods of a Ruby Object
  def search_methods(param)
    methods = []
    self.methods.each { |m| methods << m if m.to_s.include? param }
    return methods
  end

  # Get Local Methods of a Ruby Object
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  # Read RI inside IRB
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end
