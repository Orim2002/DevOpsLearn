output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_task_arn" {
  value = aws_ecs_task_definition.app_task.arn
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}