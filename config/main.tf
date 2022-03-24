resource "aws_iam_user" "demo" {
  name = "spacelift-poc-${var.environment}"

  tags = local.default_tags
}

resource "aws_iam_access_key" "demo" {
  user = aws_iam_user.demo.name
}

resource "aws_iam_policy" "policy" {
  name        = "spacelift-user-policy-${var.environment}"
  description = "Spacelift user policy"
  path        = "/"

  policy = data.aws_iam_policy_document.policy.json
}

data "aws_iam_policy_document" "policy" {
  statement {
    sid = "ListOwnBuckets"

    actions = [
      "s3:*"
    ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy_attachment" "policy" {
  name       = "${aws_iam_policy.policy.name}-attachment"
  users      = [aws_iam_user.spacelift.name]
  policy_arn = aws_iam_policy.policy.arn
}
