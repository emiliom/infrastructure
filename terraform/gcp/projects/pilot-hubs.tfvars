prefix     = "pilot-hubs"
project_id = "two-eye-two-see"

core_node_machine_type = "n1-highmem-4"

# Multi-tenant cluster, network policy is required to enforce separation between hubs
enable_network_policy    = true

# Some hubs want a storage bucket, so we need to have config connector enabled
config_connector_enabled = true

notebook_nodes = {
  "user" : {
    min : 0,
    max : 20,
    machine_type : "n1-highmem-4",
    labels: { },
  },
}

dask_nodes = {
  "worker" : {
    min : 0,
    max : 100,
    machine_type : "n1-highmem-4",
    labels: { }
  }
}

user_buckets = []


hub_cloud_permissions = {
  "dask-staging" : {
    requestor_pays : true,
    bucket_admin_access: [],
    hub_namespace: "dask-staging"
  },
  "ohw" : {
    requestor_pays : true,
    bucket_admin_access: [],
    hub_namespace: "ohw"
  },
  # Can't use full name here as it violates line length restriction of service account id
  "catalyst-coop" : {
    requestor_pays : true,
    bucket_admin_access: [],
    hub_namespace: "catalyst-cooperative"
  }
}
