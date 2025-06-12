provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "storage_bucket" {
  bucket = "s3-hari-hari-D7635648264748J"
  force_destroy = true
}

#resource "aws_iam_role" "lambda_exec_role" {
#  name = "lambda_exec_role"
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17",
#    Statement = [{
#      Action    = "sts:AssumeRole",
#      Effect    = "Allow",
#      Principal = {
#        Service = "lambda.amazonaws.com"
#      },
#    }]
#  })
#}


#resource "aws_lambda_function" "mechanism_x" {
#  function_name = "mechanism_x"
#
#  filename         = "lambda_package.zip"
#  handler          = "app.lambda_handler"
#  runtime          = "python3.9"
#  role             = aws_iam_role.lambda_exec_role.arn
#  timeout          = 60
#  source_code_hash = filebase64sha256("lambda_package.zip")
#
#  environment {
#    variables = {
#      S3_BUCKET = aws_s3_bucket.Storage_bucket.bucket
#      FILE_ID   = "<your_file_id_here>"
#    }
#  }
#}
#
#resource "aws_cloudwatch_event_rule" "every_minute" {
#  name                = "every-minute"
#  schedule_expression = "rate(1 minute)" # AWS minimum is 1 minute; workaround: run continuously inside Lambda
#}
#
#resource "aws_cloudwatch_event_target" "invoke_lambda" {
#  rule      = aws_cloudwatch_event_rule.every_minute.name
#  target_id = "mech_x"
#  arn       = aws_lambda_function.mechanism_x.arn
#}
#
#
#resource "aws_lambda_permission" "allow_event_invoke" {
#  statement_id  = "AllowExecutionFromCloudWatch"
#  action        = "lambda:InvokeFunction"
#  function_name = aws_lambda_function.mechanism_x.function_name
#  principal     = "events.amazonaws.com"
#  source_arn    = aws_cloudwatch_event_rule.every_minute.arn
#}