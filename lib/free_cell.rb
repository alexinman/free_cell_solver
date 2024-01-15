require "require_all"
require_all "lib/free_cell"

filename = ARGV.first
deck = filename.empty? ? Deck.new.shuffle : Deck.parse(File.read(filename))

puts deck.inspect
