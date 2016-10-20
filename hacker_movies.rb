require_relative 'speech_kit.rb'
require_relative 'hacker.rb'
require 'unicode'


movies = File.read('movies.txt').gsub(/\(\d{4}\)/, '').split("\n")
s = SpeechKit.new('131188e1-061b-4b55-8031-cc98cc43b315')

hacker_movies = Hacker.hackerize(movies)
file_content = s.vocalize(hacker_movies.join('  '))
File.write('result.mp3', file_content.read, {mode: 'wb'})
