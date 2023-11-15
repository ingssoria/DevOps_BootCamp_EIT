# Creating GCloud App Engine

module "gcae" {
  source = "./modules/gcae"

  PROJECT_ID = var.PROJECT_ID
  REGION = var.REGION
}
