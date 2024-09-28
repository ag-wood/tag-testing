# Vars used to source tags from [{tag_group}_]tags.json file in tags repository.
variable "tag_repository" {
  description = "The repository containing tag maps.  Must be in either owner/repository or repository formats."
  type        = string
  default     = "ag-wood/tag-testing"
}

variable "tag_team_id" {
  description = "The name of a top level folder / team folder in the tag repository."
  type        = string
  default     = "cice"
}

variable "tag_group" {
  description = "The group prefix on the tags json file - default is 'tags.json' i.e. no prefix."
  type        = string
  default     = ""
}

# Optional values to over-ride or supplement values in the tags repository.

variable "Project" {
  description = "Project number or name"
  type        = string
  default     = ""
}

variable "Team" {
  description = "Team responsible for management of the resource"
  type        = string
  default     = ""
}

variable "Owner" {
  description = "The resource owner."
  type        = string
  default     = ""
}

variable "Environment" {
  description = "Environment that the resource is a part of"
  type        = string
  default     = ""

  validation {
    condition     = can(regex("^Development$|^Test$|^Production$|^$", var.Environment))
    error_message = "Environment must be one of 'Development', 'Test' or 'Production'."
  }
}

variable "ApplicationName" {
  description = "Name of the application (if applicable)"
  type        = string
  default     = ""
}

variable "Source" {
  description = "The Git source repository that the resources are built from"
  type        = string
  default     = ""
}