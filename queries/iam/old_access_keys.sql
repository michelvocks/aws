SELECT
    account_id,
    arn,
    password_last_used,
    user_name,
    access_key_id,
    last_used,
    last_rotated
FROM aws_iam_users
    JOIN
        aws_iam_user_access_keys ON
            aws_iam_users.cq_id = aws_iam_user_access_keys.user_cq_id
WHERE last_rotated < (now() - '90 days'::INTERVAL)
