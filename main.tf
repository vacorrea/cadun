// gcloud iam service-accounts keys create credentials.json --iam-account 613541413891-compute@developer.gserviceaccount.com 
provider "google" {
 credentials = file("credentials.json")
 project     = "tim-bigdata-lab"
 region      = "us-east1"
}



// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_storage_bucket" "static-site" {
  name          = "github-terraform"
  location      = "us-east1"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}
