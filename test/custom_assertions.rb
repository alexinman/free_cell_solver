def assert_raises_with_message(error_class, message, &)
  error = assert_raises(error_class, &)
  assert_equal message, error.message
end
