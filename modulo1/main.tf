# terraform {
#   required_version = "1.1.7"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.5.0"
#     }
#   }
# }


provider "aws" {
  region  = var.region
  profile = "terraform"
}




#criando uma instancia
# resource "aws_instance" "web-baa7a52965b99778f38ef37f235e9053" {
#   ami           = "ami-011c936f11bc7f3b3"
#   instance_type = "t4g.nano"

#   tags = {
#     Name = "Hello Amazon linux "
#   }
# }

#criando usuarios
resource "aws_iam_user" "the-new-accounts" {
  for_each = toset(["edc-mod1", "edc-mod2", "edc-mod3"])
  name     = each.key
}



#CRIANDO UN CLUSTER EMR
# resource "aws_emr_cluster" "cluster-modulo1-edc" {
#   name          = "modulo1-edc"
#   release_label = "emr-6.5.0"
#   applications  = ["Spark","JupyterHub","Hive"]

#   additional_info = <<EOF
# {
#   "instanceAwsClientConfiguration": {
#     "proxyPort": 8099,
#     "proxyHost": "myproxy.example.com"
#   }
# }
# EOF

#   termination_protection            = false
#   keep_job_flow_alive_when_no_steps = true



#   master_instance_group {
#     instance_type = "m4.large"
#   }

#   core_instance_group {
#     instance_type  = "c4.large"
#     instance_count = 1

#     ebs_config {
#       size                 = "40"
#       type                 = "gp2"
#       volumes_per_instance = 1
#     }

#     bid_price = "0.30"

#     autoscaling_policy = <<EOF
# {
# "Constraints": {
#   "MinCapacity": 1,
#   "MaxCapacity": 2
# },
# "Rules": [
#   {
#     "Name": "ScaleOutMemoryPercentage",
#     "Description": "Scale out if YARNMemoryAvailablePercentage is less than 15",
#     "Action": {
#       "SimpleScalingPolicyConfiguration": {
#         "AdjustmentType": "CHANGE_IN_CAPACITY",
#         "ScalingAdjustment": 1,
#         "CoolDown": 300
#       }
#     },
#     "Trigger": {
#       "CloudWatchAlarmDefinition": {
#         "ComparisonOperator": "LESS_THAN",
#         "EvaluationPeriods": 1,
#         "MetricName": "YARNMemoryAvailablePercentage",
#         "Namespace": "AWS/ElasticMapReduce",
#         "Period": 300,
#         "Statistic": "AVERAGE",
#         "Threshold": 15.0,
#         "Unit": "PERCENT"
#       }
#     }
#   }
# ]
# }
# EOF
#   }

#   ebs_root_volume_size = 100

#   tags = {
#     role = "rolename"
#     env  = "env"
#   }

#   bootstrap_action {
#     path = "s3://elasticmapreduce/bootstrap-actions/run-if"
#     name = "runif"
#     args = ["instance.isMaster=true", "echo running on master node"]
#   }

#   configurations_json = <<EOF
#   [
#     {
#       "Classification": "hadoop-env",
#       "Configurations": [
#         {
#           "Classification": "export",
#           "Properties": {
#             "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
#           }
#         }
#       ],
#       "Properties": {}
#     },
#     {
#       "Classification": "spark-env",
#       "Configurations": [
#         {
#           "Classification": "export",
#           "Properties": {
#             "JAVA_HOME": "/usr/lib/jvm/java-1.8.0"
#           }
#         }
#       ],
#       "Properties": {}
#     }
#   ]
# EOF

#   service_role = "EMR_DefaultRole"
# }


# resource "aws_sagemaker_notebook_instance" "ni" {
#   name          = "my-notebook-instance"
#   role_arn      = aws_iam_role.role.arn
#   instance_type = "ml.t2.medium"

#   tags = {
#     Name = "foo"
#   }
# }