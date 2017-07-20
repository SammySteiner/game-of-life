require 'game_of_life'
require 'game_of_life/generater'
require 'game_of_life/iterater'
require 'game_of_life/printer'

describe GameOfLife do
  subject { GameOfLife.new(generater: generater, iterater: iterater, printer: printer) }
  let(:generater) { instance_double(GameOfLife::Generater) }
  let(:board) { 'an awesome board!' }
  let(:iterater) { instance_double(GameOfLife::Iterater) }
  let(:iterated_board) { 'an older awesome board!!' }
  let(:printer) { instance_double(GameOfLife::Printer) }

  it 'should play the game for a given number of generations' do
    generations = 1
    expect(generater).to receive(:seed_board).and_return(board)
    expect(printer).to receive(:display).with(board)
    expect(iterater).to receive(:iterate).with(board).and_return(iterated_board)
    expect(printer).to receive(:display).with(iterated_board)

    subject.play(generations)
  end

end
