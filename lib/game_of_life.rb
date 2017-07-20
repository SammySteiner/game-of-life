class GameOfLife

  def initialize(generater: GameOfLife::Generater.new, iterater: GameOfLife::Iterater.new, printer: GameOfLife::Printer.new)
    @generater = generater
    @iterater = iterater
    @printer = printer
  end

  def play(generations)
    board = @generater.seed_board
    generations.times do
      @printer.display(board)
      board = @iterater.iterate(board)
    end
    @printer.display(board)

  end

end
