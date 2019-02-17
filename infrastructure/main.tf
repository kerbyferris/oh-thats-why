terraform {
  backend "s3" {
    bucket = "tf-state-575575708653"
    key    = "terraform.rustLambda.tfstate"
    region = "us-east-1"
  }
}

resource "aws_dynamodb_table" "table" {
  name           = "Amz_Orders"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "OrderId"
  range_key      = "OrderDate"

  attribute {
    name = "OrderId"
    type = "S"
  }

  attribute {
    name = "OrderDate"
    type = "S"
  }

  attribute {
    name = "Category"
    type = "S"
  }

  local_secondary_index {
    name            = "OrderCategoryIndex"
    range_key       = "Category"
    projection_type = "ALL"
  }
}
