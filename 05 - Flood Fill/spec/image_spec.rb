require 'spec_helper'
require 'pry'

describe Image do
  before :each do
    pixels = [
      'blue', 'blue', 'blue', 'blue', 'blue', 'blue',
      'blue', 'red',  'red',  'red',  'red',  'blue',
      'blue', 'red',  'blue', 'blue', 'red',  'blue',
      'blue', 'red',  'blue', 'blue', 'red',  'blue',
      'blue', 'red',  'red',  'red',  'red',  'blue',
      'blue', 'blue', 'blue', 'blue', 'blue', 'blue'
    ]
    width = 6
    height = 7
    @image = Image.new(width, height, pixels)
  end

  it 'changes inner section with flood_fills' do
    @image.flood_fill(3, 3, 'green', 'blue')
    expect(@image.display).to eq(
      [["blue", "blue", "blue",  "blue",  "blue", "blue"],
       ["blue",  "red",  "red",   "red",   "red",  "blue"],
       ["blue",  "red",  "green", "green", "red",  "blue"],
       ["blue",  "red",  "green", "green", "red",  "blue"],
       ["blue",  "red",  "red",   "red",   "red",  "blue"],
       ["blue",  "blue", "blue",  "blue",  "blue", "blue"]]
    )
  end

  it 'changes outer section with flood_fills' do
    @image.flood_fill(1, 1, 'green', 'blue')
    expect(@image.display).to eq(
      [['green', 'green', 'green', 'green', 'green', 'green'],
       ['green', 'red',  'red',  'red',  'red',  'green'],
       ['green', 'red',  'blue', 'blue', 'red',  'green'],
       ['green', 'red',  'blue', 'blue', 'red',  'green'],
       ['green', 'red',  'red',  'red',  'red',  'green'],
       ['green', 'green', 'green', 'green', 'green', 'green']]
    )
  end

  it 'changes another inner section with flood_fills' do
    @image.flood_fill(2, 2, 'green', 'red')
    expect(@image.display).to eq(
      [['blue', 'blue', 'blue', 'blue', 'blue', 'blue'],
      ['blue', 'green',  'green',  'green',  'green',  'blue'],
      ['blue', 'green',  'blue', 'blue', 'green',  'blue'],
      ['blue', 'green',  'blue', 'blue', 'green',  'blue'],
      ['blue', 'green',  'green',  'green',  'green',  'blue'],
      ['blue', 'blue', 'blue', 'blue', 'blue', 'blue']]
    )
  end
end
