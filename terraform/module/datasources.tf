data "github_repository_file" "tag_source" {
  repository = var.tag_repository
  branch     = "main"
  file       = "${var.tag_team_id}/${local.repo_tag_file}"
}
