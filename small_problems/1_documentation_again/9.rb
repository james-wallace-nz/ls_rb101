# Sometimes, the documentation is going to leave you scratching your head.

# In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages
# from a YAML file. We do this with YAML::load_file:

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

# https://apidock.com/ruby/YAML/load_file/class
# Method deprecated or moved
# This method is deprecated or moved on the latest stable version. The last existing version (v1_9_1_378) is shown here.

# These similar methods exist in v2_5_5:

# IRB::IrbLoader#load_file
# Gem::ConfigFile#load_file
# Psych#load_file

# load_file( filepath ) public
# Load a document from the file located at filepath.

# YAML.load_file( 'animals.yaml' )
   #=> ['badger', 'elephant', 'tiger']



# Psych is a YAML parser and emitter.
# Psych::load_file

load_file(filename, fallback: false)click to toggle source
# Load the document contained in filename. Returns the yaml contained in filename as a Ruby object, or if the file is empty, it returns the specified fallback return value, which defaults to false.
