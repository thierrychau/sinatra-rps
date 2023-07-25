require "sinatra"
require "sinatra/reloader"

rbs = ["rock", "paper", "scissors"]

def rbs_game(user_rbs, computer_rbs)
  if user_rbs == computer_rbs
    return "tied"
  elsif (user_rbs == "rock" && computer_rbs == "scissors") || (user_rbs == "scissors" && computer_rbs == "paper") || (user_rbs == "paper" && computer_rbs == "rock")
    return "won"
  else
    return "lost"
  end
end

get("/") do
  erb(:rules)
end

=begin
get("/rock") do
  @player_rbs = "rock"

  @computer_rbs = rbs.sample

  @rbs_outcome = rbs_game(@player_rbs, @computer_rbs)

  erb(:rock)
end

get("/paper") do
  @player_rbs = "paper"

  @computer_rbs = rbs.sample

  @rbs_outcome = rbs_game(@player_rbs, @computer_rbs)

  erb(:paper)
end

get("/scissors") do
  @player_rbs = request.path_info.gsub("/","")

  @computer_rbs = rbs.sample

  @rbs_outcome = rbs_game(@player_rbs, @computer_rbs)

  erb(:scissors)
end
=end

rbs.each do |hand|
  get("/#{hand}") do
    @computer_rbs = rbs.sample

    @rbs_outcome = rbs_game(hand, @computer_rbs)

    erb(:rbs)
  end
end
