provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      Environment = "Test"
      Project     = "Exercise"
    }
  }
  profile = "cc-devops-29"
}
