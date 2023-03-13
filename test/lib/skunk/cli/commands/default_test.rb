# frozen_string_literal: true

require "test_helper"
require "minitest/stub_const"

require "skunk/cli/commands/default"

describe Skunk::Cli::Command::Default do
  describe "#sharing?" do
    let(:subject) { Skunk::Cli::Command::Default.new({}) }

    it "returns true" do
      env = ENV.to_hash.merge("SHARE" => "true")
      Object.stub_const(:ENV, env) do
        _(subject.sharing?).must_equal true
      end
    end

    it "returns false" do
      _(subject.sharing?).must_equal false
    end
  end
end
