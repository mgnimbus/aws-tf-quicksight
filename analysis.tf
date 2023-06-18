/*
resource "aws_quicksight_analysis" "example" {
  analysis_id             = "05459756-d4f8-4f33-8a23-6b4d8312a1e2"
  arn                     = "arn:aws:quicksight:us-east-1:328268088738:analysis/05459756-d4f8-4f33-8a23-6b4d8312a1e2"
  aws_account_id          = "328268088738"
  created_time            = "2023-06-14T17:53:00Z"
  id                      = "328268088738,05459756-d4f8-4f33-8a23-6b4d8312a1e2"
  last_updated_time       = "2023-06-14T17:53:00Z"
  name                    = "Sales Pipeline analysis"
  recovery_window_in_days = 30
  status                  = "CREATION_SUCCESSFUL"
  tags                    = {}
  tags_all                = {}

  definition {

    data_set_identifiers_declarations {
      data_set_arn = "arn:aws:quicksight:us-east-1:328268088738:dataset/deb1e9a4-cf25-4aca-ad0d-9db6e30f3a6f"
      identifier   = "Sales Pipeline"
    }

    sheets {
      content_type = "INTERACTIVE"
      name         = "Sheet 1"
      sheet_id     = "a917d6da-38ad-4567-9fa8-661b89c3adc4"

      visuals {

        line_chart_visual {
          visual_id = "370d02aa-c157-4a0d-a46f-d0780dd7d471"

          chart_configuration {
            type = "LINE"

            field_wells {
              line_chart_aggregated_field_wells {
                category {

                  date_dimension_field {
                    field_id     = "FieldId2"
                    hierarchy_id = "FieldId2"

                    column {
                      column_name         = "Date"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }

                colors {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "Opportunity Stage"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }
              }
            }

            sort_configuration {
              category_items_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              color_items_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              small_multiples_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }
            }
          }

          column_hierarchies {
            date_time_hierarchy {
              hierarchy_id = "FieldId2"
            }
          }

          subtitle {
            visibility = "VISIBLE"
          }

          title {
            visibility = "VISIBLE"

            format_text {
              plain_text = "Historical  opportunity pipeline"
            }
          }
        }
      }
      visuals {

        pie_chart_visual {
          visual_id = "36f0e0ce-a2a4-40ef-8ec8-9e1a64c84df6"

          chart_configuration {

            donut_options {
              arc_options {
                arc_thickness = "WHOLE"
              }
            }

            field_wells {
              pie_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "Opportunity Stage"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }

                values {

                  numerical_measure_field {
                    field_id = "FieldId2"

                    aggregation_function {
                      simple_numerical_aggregation = "SUM"
                    }

                    column {
                      column_name         = "Weighted Revenue"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }
              }
            }

            sort_configuration {
              category_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              category_sort {

                field_sort {
                  direction = "DESC"
                  field_id  = "FieldId1"
                }
              }

              small_multiples_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }
            }
          }

          subtitle {
            visibility = "VISIBLE"
          }

          title {
            visibility = "VISIBLE"

            format_text {
              plain_text = "Current open pipeline by weighted revenue"
            }
          }
        }
      }
      visuals {
        bar_chart_visual {
          visual_id = "3b995ef7-4c55-47a8-a56f-92eada5c0071"

          chart_configuration {
            bars_arrangement = "CLUSTERED"
            orientation      = "HORIZONTAL"

            field_wells {
              bar_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "FieldId2"

                    column {
                      column_name         = "Segment"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }

                colors {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "Opportunity Stage"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }
              }
            }

            sort_configuration {
              category_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              category_sort {

                field_sort {
                  direction = "DESC"
                  field_id  = "FieldId2"
                }
              }

              color_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              small_multiples_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }
            }
          }

          subtitle {
            visibility = "VISIBLE"
          }

          title {
            visibility = "VISIBLE"

            format_text {
              plain_text = "YTD Opportunities by Stage and Segment"
            }
          }
        }
      }
      visuals {
        bar_chart_visual {
          visual_id = "6838187c-72f5-4e04-860d-18b7b5345951"

          chart_configuration {
            bars_arrangement = "CLUSTERED"
            orientation      = "HORIZONTAL"

            field_wells {
              bar_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "FieldId2"

                    column {
                      column_name         = "Region"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }

                colors {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "Opportunity Stage"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }
              }
            }

            sort_configuration {
              category_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              category_sort {

                field_sort {
                  direction = "DESC"
                  field_id  = "FieldId2"
                }
              }

              color_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              small_multiples_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }
            }
          }

          subtitle {
            visibility = "VISIBLE"
          }

          title {
            visibility = "VISIBLE"

            format_text {
              plain_text = "YTD Count of Wins vs Losses by Region"
            }
          }
        }
      }
      visuals {

        pie_chart_visual {
          visual_id = "f23355b0-ebb1-4da2-bf73-9e61f224fb11"

          chart_configuration {

            donut_options {
              arc_options {
                arc_thickness = "WHOLE"
              }
            }

            field_wells {
              pie_chart_aggregated_field_wells {
                category {
                  categorical_dimension_field {
                    field_id = "FieldId1"

                    column {
                      column_name         = "Region"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }

                values {

                  numerical_measure_field {
                    field_id = "FieldId2"

                    aggregation_function {
                      simple_numerical_aggregation = "SUM"
                    }

                    column {
                      column_name         = "Weighted Revenue"
                      data_set_identifier = "Sales Pipeline"
                    }
                  }
                }
              }
            }

            sort_configuration {
              category_items_limit {
                items_limit      = 0
                other_categories = "INCLUDE"
              }

              small_multiples_limit_configuration {
                items_limit      = 0
                other_categories = "INCLUDE"
              }
            }
          }

          subtitle {
            visibility = "VISIBLE"
          }

          title {
            visibility = "VISIBLE"

            format_text {
              plain_text = "YTD Revenue realized by Region"
            }
          }
        }
      }
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
*/
# terraform import aws_quicksight_analysis.example 328268088738,05459756-d4f8-4f33-8a23-6b4d8312a1e2
