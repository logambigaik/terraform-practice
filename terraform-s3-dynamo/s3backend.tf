#---------------------------------------------------------------------------
# S3 BACKEND
#--------------------------------------------------------------------------
terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-state-s3bucket-test1"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
