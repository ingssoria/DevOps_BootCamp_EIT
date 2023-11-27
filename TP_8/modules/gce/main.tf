# Generate openapi_spec.yaml
resource "local_file" "generated_openapi_yaml" {
  filename = "${path.module}/openapi_spec.yaml"
  content  = templatefile("${path.module}/openapi_spec_template.yaml", {
    api_title       = var.APP_ENGINE_NAME,
    api_description = "${var.APP_ENGINE_NAME} Description"
    api_host        = "${var.SERVICE_NAME}.endpoints.${var.PROJECT_ID}.cloud.goog"    
  })
}

# Generate google_endpoints_service Resource
resource "google_endpoints_service" "tp-8-endpoints_service" {
  service_name   = "${var.SERVICE_NAME}.endpoints.${var.PROJECT_ID}.cloud.goog"
  project        = var.PROJECT_ID
  openapi_config = file("${path.module}/openapi_spec.yaml")
}