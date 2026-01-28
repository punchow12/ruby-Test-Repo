class DFA
	def initialize(states, alphabet, transitions, start_state, accept_state):
		@states = states
		@alphabet = alphabet
		@transitions = transitions
		@current_state = start_state
		@accept_state = accept_state
	end

	def feed(input_string)
		input_string.chars.each do |char|
			unless @alphabet.include?(char)
				puts "Error Character '#{char}' not in alphabet."
				return false
			end

			@current_state = @transitions[current_state][char]
		end

		accepted?
	end

	def accepted?
		@accepted_states.include?(@current_state)
	end
end

transitions = {
	q_even:{'0' => :q_odd, '1' => :q_even},
	q_odd: {'0' => :q_even, '1' => :q_odd}
}

dfa = DFA.new(
	[:q_even,:q_odd],
	['0', '1']
	transitions,
	:q_even,
	[:q_even]
	)
puts "Testing '001': #{dfa.feed('001')}" 
