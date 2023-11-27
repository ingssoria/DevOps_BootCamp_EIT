# Creating GCloud App Engine

module "gcae" {
  source = "./modules/gcae"

  PROJECT_ID = var.PROJECT_ID
  REGION = var.REGION
}

# Creating GCloud Endpoint

module "gce" {
  source = "./modules/gce"

  PROJECT_ID = var.PROJECT_ID
  REGION = var.REGION
  APP_ENGINE_NAME = module.gcae.name
  SERVICE_NAME = var.SERVICE_NAME
}

