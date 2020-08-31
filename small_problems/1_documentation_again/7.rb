# Use irb to run the following code:

s = 'abc'
puts s.public_methods.inspect

# You should find that it prints a list of all of the public methods available to the String s; this includes not only
# those methods defined in the String class, but also methods that are inherited from Object (which inherits other
# methods from the BasicObject class and the Kernel module). That's a lot of methods.


# [:unicode_normalize, :unicode_normalize!, :ascii_only?, :to_r, :unpack, :unpack1, :encode!, :%, :include?, :*, :+, :count, :partition, :+@, :-@, :<=>, :<<, :to_c, :==, :===, :sum, :=~, :next, :[], :casecmp, :casecmp?, :insert, :[]=, :match, :match?, :bytesize, :empty?, :eql?, :succ!, :next!, :upto, :index, :rindex, :replace, :clear, :chr, :getbyte, :setbyte, :scrub!, :scrub, :undump, :byteslice, :freeze, :inspect, :capitalize, :upcase, :dump, :downcase!, :swapcase, :downcase, :hex, :capitalize!, :upcase!, :lines, :length, :size, :codepoints, :succ, :split, :swapcase!, :bytes, :oct, :prepend, :grapheme_clusters, :concat, :start_with?, :reverse, :reverse!, :to_str, :to_sym, :crypt, :ord, :strip, :end_with?, :to_s, :to_i, :to_f, :center, :intern, :gsub, :ljust, :chars, :delete_suffix, :sub, :rstrip, :scan, :chomp, :rjust, :lstrip, :chop!, :delete_prefix, :chop, :sub!, :gsub!, :delete_prefix!, :chomp!, :strip!, :lstrip!, :rstrip!, :squeeze, :delete_suffix!, :tr, :tr_s, :delete, :each_line, :tr!, :tr_s!, :delete!, :squeeze!, :slice, :each_byte, :each_char, :each_codepoint, :each_grapheme_cluster, :b, :slice!, :rpartition, :encoding, :force_encoding, :valid_encoding?, :hash, :unicode_normalized?, :encode, :clamp, :between?, :<=, :>=, :>, :<, :dup, :itself, :yield_self, :then, :taint, :tainted?, :untaint, :untrust, :untrusted?, :trust, :frozen?, :methods, :singleton_methods, :protected_methods, :private_methods, :public_methods, :instance_variables, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :instance_of?, :kind_of?, :is_a?, :tap, :clone, :display, :class, :singleton_class, :method, :public_send, :public_method, :singleton_method, :define_singleton_method, :extend, :to_enum, :enum_for, :!~, :nil?, :respond_to?, :object_id, :send, :__send__, :!, :__id__, :!=, :equal?, :instance_eval, :instance_exec]
# => nil


# How would you modify this code to print just the public methods that are defined or overridden by the String class?
# That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.

puts s.public_methods(false).inspect

# [:unicode_normalize, :unicode_normalize!, :ascii_only?, :to_r, :unpack, :unpack1, :encode!, :%, :include?, :*, :+, :count, :partition, :+@, :-@, :<=>, :<<, :to_c, :==, :===, :sum, :=~, :next, :[], :casecmp, :casecmp?, :insert, :[]=, :match, :match?, :bytesize, :empty?, :eql?, :succ!, :next!, :upto, :index, :rindex, :replace, :clear, :chr, :getbyte, :setbyte, :scrub!, :scrub, :undump, :byteslice, :freeze, :inspect, :capitalize, :upcase, :dump, :downcase!, :swapcase, :downcase, :hex, :capitalize!, :upcase!, :lines, :length, :size, :codepoints, :succ, :split, :swapcase!, :bytes, :oct, :prepend, :grapheme_clusters, :concat, :start_with?, :reverse, :reverse!, :to_str, :to_sym, :crypt, :ord, :strip, :end_with?, :to_s, :to_i, :to_f, :center, :intern, :gsub, :ljust, :chars, :delete_suffix, :sub, :rstrip, :scan, :chomp, :rjust, :lstrip, :chop!, :delete_prefix, :chop, :sub!, :gsub!, :delete_prefix!, :chomp!, :strip!, :lstrip!, :rstrip!, :squeeze, :delete_suffix!, :tr, :tr_s, :delete, :each_line, :tr!, :tr_s!, :delete!, :squeeze!, :slice, :each_byte, :each_char, :each_codepoint, :each_grapheme_cluster, :b, :slice!, :rpartition, :encoding, :force_encoding, :valid_encoding?, :hash, :unicode_normalized?, :encode]
# => nil
