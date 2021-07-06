resource "aws_iam_account_password_policy" "uppercase" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = false
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "lowercase" {
  minimum_password_length        = 14
  require_lowercase_characters   = false
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "symbols" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = false
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "numbers" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = false
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "missing_length" {
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "length" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "reuse_prevention" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 8
  max_password_age               = 10
}

resource "aws_iam_account_password_policy" "missing_max_age" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
}

resource "aws_iam_account_password_policy" "max_age" {
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 91
}
