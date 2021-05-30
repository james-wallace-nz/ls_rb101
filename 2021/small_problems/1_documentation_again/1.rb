# https://ruby-doc.org/core-3.0.1/File.html#method-c-path

# path(path) → string
# Returns the string representation of the path

# File.path("/dev/null")          #=> "/dev/null"
# File.path(Pathname.new("/tmp")) #=> "/tmp"


# https://ruby-doc.org/core-3.0.1/File.html#method-i-path

# path → filename
# to_path → filename
# Returns the pathname used to create file as a string. Does not normalize the name.

# The pathname may not point to the file corresponding to file. For instance, the pathname becomes void when the file has been moved or deleted.

# This method raises IOError for a file created using File::Constants::TMPFILE because they don’t have a pathname.

# File.new("testfile").path               #=> "testfile"
# File.new("/tmp/../tmp/xxx", "w").path   #=> "/tmp/../tmp/xxx"


# File::path is a class method while File#path is an instance method of the File class

# class methods are called on the class, while instance methods are called on objects

File.path('bin')
f = File.new('my-file.txt')
f.path
