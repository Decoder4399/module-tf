#dev infra below------

module "dev-infra" {
  source = "./infra"
  bucket_name = "my-module-bucket1"
  env = "dev"
  instance_count = 1
  instance_type = "t3.micro"
  hash_key = "my_ID"
}

module "prod-infra" {
  source = "./infra"
  bucket_name = "my-module-bucket2"
  env = "prod"
  instance_count = 1
  instance_type = "t3.micro"
  hash_key = "my_ID"
}

module "stg-infra" {
  source = "./infra"
  bucket_name = "my-module-bucket3"
  env = "stg"
  instance_count = 1
  instance_type = "t3.micro"
  hash_key = "my_ID"
}