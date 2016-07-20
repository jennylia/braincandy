def solver 
  	File.open("./test.txt", "r") do |f|
  		f.each_line do |line|
  			word_count = {}
  			word_count[:A] = line.count("A")
  			word_count[:B] = line.count("B")
  			word_count[:C] = line.count("C")
  			word_count[:D] = line.count("D")
  			puts "answer is:  #{word_count.key(word_count.values.max)}"
  		end
  	end
end

solver