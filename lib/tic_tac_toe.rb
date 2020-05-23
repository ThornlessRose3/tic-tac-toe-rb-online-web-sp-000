# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
# Define display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define input_to_index 
def input_to_index(user_input)
return user_input.to_i - 1
end

# Define move
def move(array, index, value = "X")
array[index] = value
return array
end

# Define position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define #valid_move?
def valid_move?(board, index)
  if index.between?(0,8)
    return !position_taken?(board, index)
  else  
    return FALSE
  end
end

# Define turn 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board,index)
  else
    turn(board)
  end
  display_board(board)
end

# Define turn_count
def turn_count(board)
  turns = 0 
  i = 0 
  while i < 9 
    if position_taken?(board, i)
      turns += 1-9
    end
    i += 1
  end
  return turns
end

# Define current_player

# Define won?
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]
    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index1)
      return win_combination
    end
  end
  nil
end

# Define full?
def full?(board)
  i = 0
  while i < 9
    if position_taken?(board, i)
    else
      return nil
    end
    i += 1
  end
  position_taken?(board, 0)
end

# Define draw?
def draw?(board)
  if won?(board)
    return nil
  elsif full?(board)
    return true
  else
    return nil
  end
end

# Define over?
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return nil
  end
end

# Define winner
def winner(board)
  if won?(board) == nil
    return nil
  else
    token = board[won?(board)[0]]
    return token
  end
end

# Define play (to be modified)
def play(board)
  until counter == 9
    counter = turn_count(board)
    if over?(board)
      break
    else
      turn(board)
    end
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}"
  elsif draw?(board)
    return "Cats Game!"
  else
    turn(board)
  end
end