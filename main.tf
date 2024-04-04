terraform {
  cloud {
    organization = "lanilsen"

    workspaces {
      name = "azure_tf_kreftforeningen"
    }
  }
}