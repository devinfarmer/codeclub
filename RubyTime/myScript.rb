$response = ""
$correct_reply = false
$riddle_hash = { "What goes up when rain comes down" => "umbrella", 
	"What walks on four legs in the morning, two in the afternoon, and three at night?" => "man",
	"Poor people have it, rich people need it, if you eat it you'll die" => "nothing"
}
$random = Random.new

def ask_riddle
	puts $riddle_hash[$random.max($riddle_hash.length)]
	$response = gets.chomp
	check_response
end

def check_response
		if $response.downcase.include? "man"
			$correct_reply = true
		 puts "Good job! You got it right!"
	else
		puts "try again"
		ask_riddle
	end
end


until $correct_reply
	ask_riddle
end




