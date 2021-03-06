require 'minitest_helper'
require 'plugins/pre_commit/checks/pry'

describe PreCommit::Checks::Pry do
  let(:check){ PreCommit::Checks::Pry }

  it "succeeds if nothing changed" do
    check.call([]).must_equal nil
  end

  it "succeeds if only good changes" do
    check.call([test_filename('valid_file.rb')]).must_equal nil
  end

  it "fails if file contains pry" do
    check.call([test_filename('pry_file.rb')]).must_equal "binding.pry found:\ntest/files/pry_file.rb:3:    binding.pry"
  end
end
