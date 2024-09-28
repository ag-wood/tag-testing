# tag-testing

Test repo for managing tags in terraform

# Purpose

This repository provides a simple mechanism to create a centralised key value store in json format for tags that are applied to cloud resources e.g. Azure and AWS.
The aim is to provide a single location for teams within an organisation to update tags and maintain consistency over time.

Primarily conceived for use with a terraform module for AWS and Azure resource tagging.  An example and associated module are provided to illustrate the use case.

# Implementation

The [terraform/example](terraform/example) directory contains a simple consumer that invokes the included [terraform/module](terraform/module) and outputs the tags 
returned from the module.

The [terraform/module](terraform/module) uses a data lookup to retrieve a json file from a given GitHub repository and returns the map of values for use as the 
input to the tags property of a resource definition.  Some sample variables are defined that can add or override values retrieved from the json tags.

The tags repository contains a directory for each team that needs to maintain tags for their projects (e.g. [team1](team1), [team2](team2) etc.)

In a production implementation it is assumed that a separate repository would contain each of the module, the tags and the consumer.

# Examples

1. Call the module to retrieve tags in the team2 directory of the tags repository, overriding the Environment tag value:

    ```terraform
    module "tags" {
      source = "../module"

      tag_team_id = "team2"
      Environment = "Development"
    }
    ```

2. Specify repository to retrieve tags from:

    ```terraform
    module "tags" {
      source = "../module"

      tag_repository = "ag-wood/tag-testing"
      tag_team_id = "team1"
    }
    ```

# Next steps

The module can be customised to perform extra validation, include options for how to handle retrieving tags etc.  Authentication requires that the GITHUB_TOKEN is defined with a token with required access to the target tag repository. More informaion on the authentication requirements can be found in the terraform documentation for the Github provider
e.g. [Repository File Lookup](https://registry.terraform.io/providers/integrations/github/latestdocs/data-sources/repository_file#content).