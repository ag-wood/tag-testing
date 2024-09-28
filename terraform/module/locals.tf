locals {
  repo_tag_file = var.tag_group != "" ? "${var.tag_group}_tags.json" : "tags.json"
  repo_tags     = jsondecode(data.github_repository_file.tag_source.content)

  var_tags = {
    Project         = var.Project
    Team            = var.Team
    Owner           = var.Owner
    Environment     = var.Environment
    ApplicationName = var.ApplicationName
    Source          = var.Source
  }

  all_tags = {
    for name, value in merge(local.repo_tags, local.var_tags) : name => value if value != ""
  }
}
