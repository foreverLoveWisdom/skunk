# frozen_string_literal: true

require 'test_helper'

require 'skunk/cli/options/argv'

describe Skunk::Cli::Options::Argv do
  describe '#output_filename' do
    context 'passing --out=FILE options' do
      let(:argv) { ['--out=file.txt'] }

      it 'parses passed filename' do
        parser = Skunk::Cli::Options::Argv.new(argv)
        parser.parse
        _(parser.output_filename).must_equal 'file.txt'
      end
    end

    context 'not passing the --out option' do
      it 'is nil' do
        parser = Skunk::Cli::Options::Argv.new([])
        parser.parse
        _(parser.output_filename).must_be_nil
      end
    end
  end
end
