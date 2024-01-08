def assert_raises_with_message(error_class, message, &)
  error = assert_raises(error_class, &)
  assert_equal message, error.message
end

def assert_not_equal(expected, actual, message=nil)
  message ||= "Expected #{actual} to NOT equal #{expected}"
  assert expected != actual, message
end
