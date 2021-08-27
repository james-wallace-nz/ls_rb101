# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

# Example output:

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# Example text data

# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

# Example replacement words

ADJECTIVES  = %w(quick lazy sleepy ugly)
NOUNS       = %w(fox dog head leg)
VERBS       = %w(jumps lifts bites licks)
ADVERBS     = %w(easily lazily noisily excitedly)


def import_file(filename)
  text = File.read(filename)
end

def madlib(filename)

  # File.open(filename).each_line do |line|
  #   line.gsub!('%{adjective}', ADJECTIVES.sample)
  #   line.gsub!('%{noun}', NOUNS.sample)
  #   line.gsub!('%{verb}', VERBS.sample)
  #   line.gsub!('%{adverb}', ADVERBS.sample)
  #   puts line
  # end


  File.open(filename) do |file|
    file.each_line do |line|
      puts format(line, { :adjective => ADJECTIVES.sample,
                        :noun => NOUNS.sample,
                        :verb => VERBS.sample,
                        :adverb => ADVERBS.sample }
                 )
    end
  end
end

madlib('sample_text.txt')
