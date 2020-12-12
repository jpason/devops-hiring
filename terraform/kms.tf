data "aws_iam_policy_document" "kms_policy" {
 
  statement {
    sid = "1"
    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey",
      "kms:GenerateDataKeyWithoutPlaintext",
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_iam_user" "kmsuser" {
  name = "kmsuser"
}

resource "aws_iam_access_key" "kmsuser" {
  user = aws_iam_user.kmsuser.name
}

resource "aws_iam_user_policy" "kmsuser_policy" {
  name = "kmsuser_access_policy"
  user = aws_iam_user.kmsuser.name

  policy = data.aws_iam_policy_document.kms_policy.json
}

resource "aws_kms_key" "sops_key" {
  description = "Key for SOPS"
}
