SELECT account_id,
    region,
    id,
    COUNT(n.cq_id) AS interfaces
FROM aws_ec2_instances i
    LEFT JOIN
        aws_ec2_instance_network_interfaces n ON i.cq_id = n.instance_cq_id
GROUP BY account_id,
    region,
    id
HAVING COUNT(n.cq_id) > 1
