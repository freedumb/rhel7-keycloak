# rhel7-keycloak
### Run Keycloak (1.9.2) within a Docker container on OpenShift Enterprise v3.x

#### Instructions for deploying to OpenShift Enterprise 3.1.x
1. Clone this git repository.  And copy the GIT URL (to clipboard) to your GIT repo.  
2. Log into OpenShift via CLI (or Web UI)  
3. Create a new project.  
  **CLI command:** _oc new-project keycloak_   
4. Next, create a new application.  
  **CLI command:** _oc new-app [Path to GIT URL .git]_  
5. Get a list of all services.  
  **CLI command:** _oc get svc_. Note down the service name. (Note: The keycloak server service listens on port 8080.)    
6. Expose the service via a route.  
  **CLI command:** _oc expose svc [service name]_    
7. Log into the Web UI, go to the overview tab & click on the route name. This should open a new browser tab with the keycloak server admin UI.  


#### Optional Steps:
1. List all pods - oc get pods  
2. Tail/View the log for the build/deploy pods - oc logs -f [Name or ID of build or deploy pod]  

