workflow RunScripts {
    parallel {
        InlineScript { kubectl proxy }
        InlineScript { kubectl port-forward deployment/fa-postgres-rev 5432 }
    }
}

RunScripts