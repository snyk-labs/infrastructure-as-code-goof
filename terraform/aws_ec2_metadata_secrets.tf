resource "aws_instance" "denied" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
  user_data = <<META
SECRET_ACCESS_ID=ASIA1234FFFFF4567HHH
META
}

resource "aws_instance" "denied_2" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
  user_data_base64 = <<META
U0VDUkVUX0FDQ0VTU19JRD1BU0lBMTIzNEZGRkZGNDU2N0hISApTRUNSRVRfQUNDRVNTX0tFWT0xMjM0NWFhYWFhYTY3ODkwYmJiYmJiYjEyMzQ1NDY1Y2NjZCtjZHJyCg==
META
}

resource "aws_instance" "denied_3" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
  user_data = <<META
SECRET_ACCESS_KEY=12345aaaaaa67890bbbbbbb12345465cccd+cdrr
META
}

resource "aws_instance" "allowed" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
  user_data = <<META
SECRET_ACCESS_ID={SOME-PROVIDER-DATA}
META
}

resource "aws_instance" "allowed_2" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
  user_data_base64 = <<META
U0VDUkVUX0FDQ0VTU19JRD1ub19zZWNyZXRfaGVyZQpTRUNSRVRfQUNDRVNTX0tFWT1pdF9zaG91bGRudF9tYXR0ZXIK
META
}

resource "aws_instance" "allowed_3" {
  metadata_options {
    http_tokens = "required"
  }
  root_block_device {
    encrypted = true
  }
}

# Invalid base64
# resource "aws_instance" "allowed_4" {
#   metadata_options {
#     http_tokens = "required"
#   }
#   root_block_device {
#     encrypted = true
#   }
#   user_data_base64 = <<META
# SOME_TEXT+THATISNOT_BASE$
# META
# }
