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



resource "aws_quicksight_analysis" "test" {
  analysis_id = "TfAnalysis"
  name        = "CoolAnalysisTf"

  definition {
    data_set_identifiers_declarations {
      data_set_arn = aws_quicksight_data_set.test.arn # ARN of the data set you want to analyse
      identifier   = "CoolSetFromTF"                  # Name of the Data Set
    }
    #  yo
    sheets {
      content_type = "INTERACTIVE"                     # Type of the content sheet you need valid values PAGINATED | INTERACTIVE
      title        = "Central logging bucket Analysis" # Display Name of the the sheet
      sheet_id     = "CoolBucketAnalysisSheetTF"
      visuals {
        pie_chart_visual {
          visual_id = "MyPieChart"
          title {
            format_text {
              plain_text = "logging Accounts by storage"
            }
          }
          chart_configuration {

            donut_options {
              arc_options {
                arc_thickness = "LARGE"
              }
            }

            field_wells {
              pie_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "record_value"
                      data_set_identifier = "CoolSetFromTF"
                    }
                  }
                }

                # values {

                #   numerical_measure_field {
                #     field_id = "FieldId2"

                #     aggregation_function {
                #       simple_numerical_aggregation = "SUM"
                #     }

                #     column {
                #       column_name         = "metric_value"
                #       data_set_identifier = "CoolSetFromTF"
                #     }
                #   }
                # }
              }
            }

            # sort_configuration {
            #   category_items_limit {
            #     items_limit      = 0
            #     other_categories = "INCLUDE"
            #   }

            #   small_multiples_limit_configuration {
            #     items_limit      = 0
            #     other_categories = "INCLUDE"
            #   }
            # }
          }
        }

      }
      /*
      visuals {
        line_chart_visual {
          visual_id = "LineChart"
          title {
            format_text {
              plain_text = "Line Chart Example"
            }
          }
          chart_configuration {
            field_wells {
              line_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "1"
                    column {
                      data_set_identifier = "1"
                      column_name         = "Column1"
                    }
                  }
                }
                values {
                  categorical_measure_field {
                    field_id = "2"
                    column {
                      data_set_identifier = "1"
                      column_name         = "Column1"
                    }
                    aggregation_function = "COUNT"
                  }
                }
              }
            }
          }
        }
      }
      */
    }
  }

  permissions {
    actions = [
      "quicksight:DeleteAnalysis",
      "quicksight:DescribeAnalysis",
      "quicksight:DescribeAnalysisPermissions",
      "quicksight:QueryAnalysis",
      "quicksight:RestoreAnalysis",
      "quicksight:UpdateAnalysis",
      "quicksight:UpdateAnalysisPermissions",
    ]
    principal = "arn:aws:quicksight:us-east-1:328268088738:user/default/328268088738"
  }
}

