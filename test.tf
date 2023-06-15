resource "aws_quicksight_data_source" "default" {
  data_source_id = "HelloFormTF"
  name           = "AwsDataCatalog" # Data source name in Athena
  parameters {
    athena {
      work_group = "primary" # Athena Workgroup in which  you qurey the metric data
    }
  }
  ssl_properties {
    disable_ssl = false
  }
  type = "ATHENA"
}
resource "aws_quicksight_data_set" "test" {
  data_set_id = "TerraformDataSet"
  name        = "CoolSetFromTF"
  import_mode = "SPICE"
  physical_table_map {
    physical_table_map_id = "TFLensMetricData"
    relational_table {
      catalog         = "AwsDataCatalog"
      data_source_arn = aws_quicksight_data_source.default.arn
      name            = "lens_metric_reports" # Table in you database
      schema          = "default"             # DataBaseinGlue
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
  permissions {
    actions = [
      "quicksight:CancelIngestion",
      "quicksight:CreateIngestion",
      "quicksight:DeleteDataSet",
      "quicksight:DescribeDataSet",
      "quicksight:DescribeDataSetPermissions",
      "quicksight:DescribeDataSetRefreshProperties",
      "quicksight:DescribeIngestion",
      "quicksight:ListIngestions",
      "quicksight:PassDataSet",
      "quicksight:UpdateDataSet",
      "quicksight:UpdateDataSetPermissions",
    ]
    principal = "arn:aws:quicksight:us-east-1:328268088738:user/default/328268088738"
  }
  depends_on = [aws_quicksight_data_source.default]
}


