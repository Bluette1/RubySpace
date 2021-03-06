begin
  gem 'minitest', '>= 5.0.0'
  require 'minitest/autorun'
  require 'minitest/pride'
  require_relative 'smallest_permutation'
rescue Gem::LoadError => e
  puts "\nMissing Dependency:\n#{e.backtrace.first} #{e.message}"
  puts 'Minitest 5.0 gem must be installed for the Ruby track.'
rescue LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class SmallestPermutationTest < Minitest::Test
  def test_find_smallest
    assert_equal 304_689, SmallestPermutation.find_smallest(846_903)
    assert_equal 1_004_568, SmallestPermutation.find_smallest(5_468_001)
    assert_equal 1345, SmallestPermutation.find_smallest(5341)
  end
end
