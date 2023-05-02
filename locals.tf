locals {
    default_tags = {
        CREATEDBY    = var.createdby
        ENVIRONMENT  = var.environment
        MAINTAINEDBY = var.maintainedby
        OWNER        = var.owner
    }
}