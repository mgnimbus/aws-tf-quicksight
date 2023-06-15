# resource "aws_quicksight_user" "exampleuser" {
#   user_name     = "testmyluck"
#   email         = "medagowtham2@yahoo.com"
#   identity_type = "QUICKSIGHT"
#   user_role     = "ADMIN"
#   # iam_arn       = aws_iam_role.quicksight_role.arn
#   depends_on = [aws_iam_role.quicksight_role]
# }

# arn:aws:iam::aws:policy/service-role/AWSQuicksightAthenaAccess

# data "aws_iam_policy_document" "quicksight_role_assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["quicksight.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role" "example" {
#   name                = "QuickSightRole"
#   assume_role_policy  = data.aws_iam_policy_document.quicksight_role_assume_role_policy.json
#   managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSQuicksightAthenaAccess"] #aws_iam_policy.policy_two.arn]
# }

# resource "aws_iam_role" "quicksight_role" {
#   name = "QuickSightRole"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Sid    = ""
#         Principal = {
#           Service = "quicksight.amazonaws.com"
#         }
#       },
#     ]
#   })
#   managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSQuicksightAthenaAccess"]
# }




# resource "aws_iam_policy" "policy_one" {
#   name = "policy-618033"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action   = ["ec2:Describe*"]
#         Effect   = "Allow"
#         Resource = "*"
#       },
#     ]
#   })
# }



/*
#terraform import aws_quicksight_data_source.example 328268088738/8d0aeb00-c78d-4cfb-9f5e-50cd9e1b391d
resource "aws_quicksight_data_source" "example" {
      arn            = "arn:aws:quicksight:us-east-1:328268088738:datasource/AwsDataCatalog"
    aws_account_id = "328268088738"
    data_source_id = "AwsDataCatalog"
    id             = "328268088738/AwsDataCatalog"
    name           = "My Cool Data in athena"
    tags_all       = {}
    type           = "ATHENA"

    parameters {

        athena {
            work_group = "primary"
        }
    }

    ssl_properties {
        disable_ssl = false
    }

        aws_account_id = "328268088738"
    data_source_id = "8d0aeb00-c78d-4cfb-9f5e-50cd9e1b391d"
    id             = "328268088738/8d0aeb00-c78d-4cfb-9f5e-50cd9e1b391d"
    name           = "AwsDataCatalog"
    tags           = {}
    tags_all       = {}
    type           = "ATHENA"

    parameters {

        athena {
            work_group = "primary"
        }
    }

    ssl_properties {
        disable_ssl = false
    }

}

# terraform import aws_quicksight_data_set.example 328268088738,a2b16359-c8ac-42d0-bb0b-7a35e221ecc7
resource "aws_quicksight_data_set" "example" {
    arn            = "arn:aws:quicksight:us-east-1:328268088738:dataset/a2b16359-c8ac-42d0-bb0b-7a35e221ecc7"
    aws_account_id = "328268088738"
    data_set_id    = "a2b16359-c8ac-42d0-bb0b-7a35e221ecc7"
    id             = "328268088738,a2b16359-c8ac-42d0-bb0b-7a35e221ecc7"
    import_mode    = "SPICE"
    name           = "lens_metric_reports"
    output_columns = [
        {
            description = ""
            name        = "version_number"
            type        = "STRING"
        },
        {
            description = ""
            name        = "configuration_id"
            type        = "STRING"
        },
        {
            description = ""
            name        = "report_date"
            type        = "STRING"
        },
        {
            description = ""
            name        = "aws_account_number"
            type        = "INTEGER"
        },
        {
            description = ""
            name        = "aws_region"
            type        = "STRING"
        },
        {
            description = ""
            name        = "storage_class"
            type        = "STRING"
        },
        {
            description = ""
            name        = "record_type"
            type        = "STRING"
        },
        {
            description = ""
            name        = "record_value"
            type        = "STRING"
        },
        {
            description = ""
            name        = "bucket_name"
            type        = "STRING"
        },
        {
            description = ""
            name        = "metric_name"
            type        = "STRING"
        },
        {
            description = ""
            name        = "metric_value"
            type        = "INTEGER"
        },
        {
            description = ""
            name        = "dt"
            type        = "STRING"
        },
    ]
    tags           = {}
    tags_all       = {}

    data_set_usage_configuration {
        disable_use_as_direct_query_source = false
        disable_use_as_imported_source     = false
    }

    logical_table_map {
        alias                = "lens_metric_reports"
        logical_table_map_id = "5bed5780-8636-4270-8f22-fd7bcac4edcc"

        data_transforms {

            tag_column_operation {
                column_name = "aws_region"

                tags {
                    column_geographic_role = "STATE"
                }
            }
        }

        source {
            physical_table_id = "e1aea955-63aa-4ff2-94b1-a9ffb139f78f"
        }
    }

    permissions {
        actions   = [
            "quicksight:CancelIngestion",
            "quicksight:CreateIngestion",
            "quicksight:CreateRefreshSchedule",
            "quicksight:DeleteDataSet",
            "quicksight:DeleteDataSetRefreshProperties",
            "quicksight:DeleteRefreshSchedule",
            "quicksight:DescribeDataSet",
            "quicksight:DescribeDataSetPermissions",
            "quicksight:DescribeDataSetRefreshProperties",
            "quicksight:DescribeIngestion",
            "quicksight:DescribeRefreshSchedule",
            "quicksight:ListIngestions",
            "quicksight:ListRefreshSchedules",
            "quicksight:PassDataSet",
            "quicksight:PutDataSetRefreshProperties",
            "quicksight:UpdateDataSet",
            "quicksight:UpdateDataSetPermissions",
            "quicksight:UpdateRefreshSchedule",
        ]
        principal = "arn:aws:quicksight:us-east-1:328268088738:user/default/328268088738"
    }

    physical_table_map {
        physical_table_map_id = "e1aea955-63aa-4ff2-94b1-a9ffb139f78f"

        relational_table {
            catalog         = "AwsDataCatalog"
            data_source_arn = "arn:aws:quicksight:us-east-1:328268088738:datasource/8776e7cd-88f4-4c48-bdab-c53dcdda7443"
            name            = "lens_metric_reports"
            schema          = "default"

            input_columns {
                name = "version_number"
                type = "STRING"
            }
            input_columns {
                name = "configuration_id"
                type = "STRING"
            }
            input_columns {
                name = "report_date"
                type = "STRING"
            }
            input_columns {
                name = "aws_account_number"
                type = "INTEGER"
            }
            input_columns {
                name = "aws_region"
                type = "STRING"
            }
            input_columns {
                name = "storage_class"
                type = "STRING"
            }
            input_columns {
                name = "record_type"
                type = "STRING"
            }
            input_columns {
                name = "record_value"
                type = "STRING"
            }
            input_columns {
                name = "bucket_name"
                type = "STRING"
            }
            input_columns {
                name = "metric_name"
                type = "STRING"
            }
            input_columns {
                name = "metric_value"
                type = "INTEGER"
            }
            input_columns {
                name = "dt"
                type = "STRING"
            }
        }
    }
}

resource "aws_quicksight_data_set" "example1" {
  arn            = "arn:aws:quicksight:us-east-1:328268088738:dataset/77281c0b-a248-43e2-998e-217f54141ade"
  aws_account_id = "328268088738"
  data_set_id    = "77281c0b-a248-43e2-998e-217f54141ade"
  id             = "328268088738,77281c0b-a248-43e2-998e-217f54141ade"
  import_mode    = "SPICE"
  name           = "import_metric_reports"
  output_columns = [
    {
      description = ""
      name        = "version_number"
      type        = "STRING"
    },
    {
      description = ""
      name        = "configuration_id"
      type        = "STRING"
    },
    {
      description = ""
      name        = "report_date"
      type        = "STRING"
    },
    {
      description = ""
      name        = "aws_account_number"
      type        = "INTEGER"
    },
    {
      description = ""
      name        = "aws_region"
      type        = "STRING"
    },
    {
      description = ""
      name        = "storage_class"
      type        = "STRING"
    },
    {
      description = ""
      name        = "record_type"
      type        = "STRING"
    },
    {
      description = ""
      name        = "record_value"
      type        = "STRING"
    },
    {
      description = ""
      name        = "bucket_name"
      type        = "STRING"
    },
    {
      description = ""
      name        = "metric_name"
      type        = "STRING"
    },
    {
      description = ""
      name        = "metric_value"
      type        = "INTEGER"
    },
    {
      description = ""
      name        = "dt"
      type        = "STRING"
    },
  ]
  tags     = {}
  tags_all = {}

  data_set_usage_configuration {
    disable_use_as_direct_query_source = false
    disable_use_as_imported_source     = false
  }

  logical_table_map {
    alias                = "import_metric_reports"
    logical_table_map_id = "52daa2ac-281e-4934-9262-3d6993dac2e0"

    data_transforms {

      tag_column_operation {
        column_name = "aws_region"

        tags {
          column_geographic_role = "STATE"
        }
      }
    }

    source {
      physical_table_id = "0eff6d82-4126-4141-8f3e-672107884617"
    }
  }

  permissions {
    actions = [
      "quicksight:CancelIngestion",
      "quicksight:CreateIngestion",
      "quicksight:CreateRefreshSchedule",
      "quicksight:DeleteDataSet",
      "quicksight:DeleteDataSetRefreshProperties",
      "quicksight:DeleteRefreshSchedule",
      "quicksight:DescribeDataSet",
      "quicksight:DescribeDataSetPermissions",
      "quicksight:DescribeDataSetRefreshProperties",
      "quicksight:DescribeIngestion",
      "quicksight:DescribeRefreshSchedule",
      "quicksight:ListIngestions",
      "quicksight:ListRefreshSchedules",
      "quicksight:PassDataSet",
      "quicksight:PutDataSetRefreshProperties",
      "quicksight:UpdateDataSet",
      "quicksight:UpdateDataSetPermissions",
      "quicksight:UpdateRefreshSchedule",
    ]
    principal = "arn:aws:quicksight:us-east-1:328268088738:user/default/328268088738"
  }

  physical_table_map {
    physical_table_map_id = "0eff6d82-4126-4141-8f3e-672107884617"

    relational_table {
      catalog         = "AwsDataCatalog"
      data_source_arn = "arn:aws:quicksight:us-east-1:328268088738:datasource/06ded9dc-d907-47d5-bbb0-de3f44018002"
      name            = "import_metric_reports"
      schema          = "import_check"

      input_columns {
        name = "version_number"
        type = "STRING"
      }
      input_columns {
        name = "configuration_id"
        type = "STRING"
      }
      input_columns {
        name = "report_date"
        type = "STRING"
      }
      input_columns {
        name = "aws_account_number"
        type = "INTEGER"
      }
      input_columns {
        name = "aws_region"
        type = "STRING"
      }
      input_columns {
        name = "storage_class"
        type = "STRING"
      }
      input_columns {
        name = "record_type"
        type = "STRING"
      }
      input_columns {
        name = "record_value"
        type = "STRING"
      }
      input_columns {
        name = "bucket_name"
        type = "STRING"
      }
      input_columns {
        name = "metric_name"
        type = "STRING"
      }
      input_columns {
        name = "metric_value"
        type = "INTEGER"
      }
      input_columns {
        name = "dt"
        type = "STRING"
      }
    }
  }
}
*/

# ea657863-14fa-4416-af24-06a617e78f4e
