module TestsHelper
  TEST_LEVELS = { 0 || 1 => :easy, 2 || 3 || 4 => :medium }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :advanced
  end
end
