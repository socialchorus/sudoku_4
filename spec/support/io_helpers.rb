
def read_output(io=output)
	io.rewind
  io.read
end

def split_boards(io=output)
  boards = read_output(io)
  boards.split "Press enter to fill the next cell\n"
end