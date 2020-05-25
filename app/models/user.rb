class User < ApplicationRecord
  def list_all_tests(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests: { level: level }, tests_users: { user_id: id })
  end
end
