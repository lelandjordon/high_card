# Use these two arrays to generate a deck of cards.
ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K" ]
suits = [ "hearts", "spades", "clubs", "diamonds" ]

players = []
full_suits = []
full_deck = []
input = ""
player = ""
players = []
#
# puts ranks + "all ranks"
# puts suits + "all suits"
# puts "all card types noted"

ace = ranks.shift[0]
ordered_ranks = ranks.push(ace)
puts ordered_ranks

ordered_ranks.each do |rank, score|  # Goes through each rank, then adds...
  suits.each do |suit|        # ... each suit, then adds each complete card...
    full_deck << [score, rank, suit] # ... to the full deck.
  end
end


# full_deck = ordered_ranks.product(suits)   #The shorter version!  But it won't
                                            # for the solution...

puts full_deck.inspect

shuffled_deck = full_deck.shuffle
puts shuffled_deck.inspect

while player != "play"
  puts "input player name"
  player = gets.chomp.to_s
  if player == "play"
    break
  end
  players << player
end
puts players

random_card = full_deck.sort_by { rand }
puts random_card.inspect

#  In-class review code! ---------------------------

players_with_cards = players.map do |player|
  {name: player, card: nil}          # Creates objects, or {hashes}, of
end                                 #  players with empty card properties

# ***********  Deals the cards ***************
players_with_cards.each do |player|  # Goes through each |player| in the players_with_cards
  card = shuffled_deck.pop   # Gets, and removes, the last card from the shuffled_deck
  player[:card] = card       # Assigns the card to the player.
end
puts players_with_cards.inspect

high_card_value_player = players_with_cards.max do |player|
  players_rank = ranks.index(player[:card][0])
end

winners = players_with_cards.select do |player|
  player[:card][0] == high_card_value_player[:card][0]
end


puts high_card_value_player[:name] + " has won with " + high_card_value_player[:card].to_s
#
# if winners.length > 1
#   puts "just kidding, it was a tie"
# end

#    Andy's in-class code:
# suits = ["spades", "clubs", "hearts", "diamonds"]
# ranks = [2,3,4,5,6,7,8,9,10, "J", "Q", "K", "A"]
# # deck = ranks.product(suits).shuffle
# deck = []
# ranks.each_with_index do |rank, score|
#   suits.each do |suit|
#     deck << [score, rank, suit]
#   end
# end
# players = []
# puts players.length.to_s + "Players so Far"
# puts "Enter a player name or type play: "
# player = gets.chomp
# while player != "play" do
#     players << player
#     puts "Enter a player name or type play: "
#     player = gets.chomp
# end
#
# players_with_cards = players.map do |player|
#   {name: player, card: nil}
# end
#
# players_with_cards.each do |player|
#   card = deck.pop
#   player[:card] = card
# end
# puts players_with_cards.inspect
#
# high_card_value_player = players_with_cards.max do |player|
#   player_rank = ranks.index(player[:card][0])
# end
#
# winners = players_with_cards.select do |player|
#   player[:card][0]  == high_card_value_player[:card][0]
# end
#
# puts high_card_value_player[:name] + " has won with " + high_card_value_player[:card].to_s
#
# if winners.length > 1
#   puts "just kidding was a tie"
# end
