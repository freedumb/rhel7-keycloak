# rhel7-keycloak
### Run Keycloak (1.9.2) within a Docker container on OpenShift Enterprise v3.x

#### Instructions for deploying to OpenShift Enterprise 3.1.x
a) Clone this git repository.  And copy the GIT URL to your GIT repo.  
b) Log into OpenShift via CLI (or Web UI)  
c) Create a new project. CLI command: oc new-project keycloak  
d) Next, create a new application. CLI command: oc new-app <Path to GIT URL .git>  
e) Get a list of all services.  CLI command: oc get svc. Note down the service name. The keycloak server service listens on port 8080.  
f) Expose the service via a route. CLI command: oc expose svc/<service name>.  
g) Log into the Web UI, go to the overview tab & click on the route name. This should open a new browser tab with the keycloak server admin UI.  


#### Optional Steps:
i) List all pods - oc get pods.  
ii) Tail/View the log for the build/deploy pods - oc logs -f <pod ID for build or deploy pod>  

