data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "${path.module}/rds_mysql_db_snapshot.py"
    output_path   = "${path.module}/rds_mysql_db_snapshot.zip"
}
resource "aws_s3_bucket_object" "this" {
 bucket = "krishnamaramq2"
 key    = "rds_mysql_db_snapshot.zip"
 source = "${path.module}/rds_mysql_db_snapshot.zip"
}
resource "aws_lambda_function" "test_lambda" {
  #filename         = "${path.module}/test.zip}"
  s3_bucket = "krishnamaramq2"
  s3_key = "rds_mysql_db_snapshot.zip"
  function_name    = "create_rds_mysql_db_snapshot"
  role             = "${aws_iam_role.iam_role_for_lambda.arn}"
  handler          = "rds_mysql_db_snapshot.lambda_handler"
  timeout = "300"
  vpc_config {
    subnet_ids         = ["${var.privatesubnet}"]
    security_group_ids = ["${var.websg}"]
  }

  runtime          = "python3.7"
}

resource "aws_iam_role" "iam_role_for_lambda" {
  name = "iam_role_for_lambda"
 # path = "/service-role/"
#  assume_role_policy = "${file("${path.module}/assumerolepolicy.json")}"
 assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name = "iam_policy_for_lambda"
#  path = "/service-role/"
   policy = "${file("${path.module}/create_rds_mysql_db_snapshot.json")}"
}
resource "aws_iam_policy_attachment" "iam_policy_attachment_for_lambda" {
  name = "iam_policy_attachment_for_lambda"
  roles = ["${aws_iam_role.iam_role_for_lambda.name}"]
  policy_arn = "${aws_iam_policy.iam_policy_for_lambda.arn}"
}
