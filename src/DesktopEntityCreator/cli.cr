require "readline"

class Cli
  def self.check_arguments
    if ARGV.size.zero?
      print "Please, provide a filename: dec [filename]"
      exit 0
    end
  end

  def self.first_argument
    ARGV[0]
  end

  def self.ask(message : String)
    Readline.readline message
  end

  def self.ask(message_func : Proc, values : Array)
    hash = {} of String => String

    values.each do |key|
      value = Readline.readline message_func.call(key)

      hash[key] = value if !value.nil?
    end
    hash
  end
end
