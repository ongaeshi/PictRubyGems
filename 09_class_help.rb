# # 09_class_help
#
# ## Description
# Display class list or methods

def main
  name = Popup.input("Class name?(e.g. Array)\nCancel: Display list")
  
  if name
    Module.const_get(name).info
  else
    class_list
  end
end

def class_list
  a = []

  ObjectSpace.each_object(Module) do |o|
    a.push o unless o.to_s.start_with? "#"
  end
 
  a.map { |e| e.to_s }.sort.join("\n")
end

class Module
  def info
    <<EOS
module #{to_s}
  include #{(included_modules - [Kernel]).join(", ")}

#{methods_str(methods(false), "#{to_s}.")}

#{methods_str(instance_methods(false))}
EOS
  end
end

class Class
  def info
    <<EOS
class #{to_s} < #{superclass}
  include #{(included_modules - [Kernel]).join(", ")}
  
#{methods_str(methods(false), "#{to_s}.")}
  
#{methods_str(instance_methods(false))}
EOS
  end
end

# 1234567890123456789012345678901234567890
def methods_str(a, header = "")
  a.map do |e|
    "  #{header}#{e}"
  end.join("\n")
end
