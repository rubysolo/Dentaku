require 'spec_helper'
require 'dentaku/ast/functions/all'
require 'dentaku'

describe Dentaku::AST::All do
  let(:calculator) { Dentaku::Calculator.new }
  it 'performs ALL operation' do
    result = Dentaku('ALL(vals, val, val > 1)', vals: [1, 2, 3])
    expect(result).to eq(false)
  end

  it 'works with a single value if needed for some reason' do
    result = Dentaku('ALL(vals, val, val > 1)', vals: 1)
    expect(result).to eq(false)

    result = Dentaku('ALL(vals, val, val > 1)', vals: 2)
    expect(result).to eq(true)
  end

  it 'raises argument error if a string is passed as identifier' do
    expect { calculator.evaluate!('ALL({1, 2, 3}, "val", val % 2 == 0)') }.to raise_error(
      Dentaku::ParseError, 'ALL() requires second argument to be an identifier'
    )
  end
end
