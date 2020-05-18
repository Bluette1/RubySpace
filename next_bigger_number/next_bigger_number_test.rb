begin
  gem 'minitest', '>= 5.0.0'
  require 'minitest/autorun'
  require 'minitest/pride'
  require_relative 'next_bigger_number'
rescue Gem::LoadError => e
  puts "\nMissing Dependency:\n#{e.backtrace.first} #{e.message}"
  puts 'Minitest 5.0 gem must be installed for the Ruby track.'
rescue LoadError => e
  puts "\nError:\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class NextBiggerNumberTest < Minitest::Test
  def test_find_next_bigger
    # bigger number exists
    assert_equal 21, NextBiggerNumber.find_next_bigger(12)
    assert_equal 531, NextBiggerNumber.find_next_bigger(513)
    assert_equal 2071, NextBiggerNumber.find_next_bigger(2017)
    assert_equal 414, NextBiggerNumber.find_next_bigger(144)
    assert_equal(-1, NextBiggerNumber.find_next_bigger(9))
    assert_equal(-1, NextBiggerNumber.find_next_bigger(111))
    assert_equal(-1, NextBiggerNumber.find_next_bigger(531))
    assert_equal 59_884_848_495_853, NextBiggerNumber.find_next_bigger(59_884_848_495_835)
    assert_equal 890, NextBiggerNumber.find_next_bigger(809)
  end
end
