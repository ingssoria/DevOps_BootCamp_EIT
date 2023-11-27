# Generate google_app_engine_application Resource
resource "google_app_engine_application" "TP_8_app_engine_application" {
  project     = var.PROJECT_ID
  location_id = var.REGION  
}



