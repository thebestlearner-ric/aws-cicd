provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
    token = "${var.token}"
}

module "s3" {
    source = "./S3"
    #bucket name should be unique
    bucket_name = "autoscaling-ric"   
    iam_user_id = "${var.aws_access_key}"    
}

module "Scale" {
  # source = "/Users/Geric/Desktop/Learning/Devops/AutoScale/Scale"
  source = "./Scale"
  region = "${var.region}"
}