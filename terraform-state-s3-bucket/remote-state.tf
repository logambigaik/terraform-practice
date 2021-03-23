terraform{
    backend "s3" {
        bucket = "terraform-state-file-storage123"
        encrypt = true
        key = "/terraform/some_state"
        region = "us-east-1"
    }
}
