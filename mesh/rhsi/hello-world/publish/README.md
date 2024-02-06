## IBM Hybrid Cloud Mesh - hello world - my custom example
This leverages skupperproject hello world example. 
1. [Setup ENVIRONMENT variables](#1-setup-environment-variables) 
2. [Build, push and deploy application](#2-build-push-and-deploy-application)

In my example the prcess to build, push and deploy the k8s hello-world example has been significantly auotomated. Distinct steps are:
- Build the docker images with identifiable names across project team members
- Push the images into your container registry
- Deploy the applciation in your cluster namespace  

To acconlish steps for the frontend and backend images, define following ENV variables in your shell. 
Using ENV vars removes hard-coded values and provides full flexiblity to customize. 
You may store these ENVs in files and `source` them. Yoy may keep them in seperate files or one file, your choice.

### 1. Setup ENVIRONMENT variables 
#### ENV image build
ENVs involved in naming the image name and pushing them into CR

**File:** env-app-image-build
```
# An arbitrary value to organize your image name . 
export EDGE_OWNER=<sg.cedge>
# An arbitrary value to organize your image name
export EDGE_DEPLOY=<ex.mesh.rhsi.helloworld>

# The architecture of the worker nodes
export ARCH=amd64

### Authenticated container registry (CR) access. This example uses IBM CR. Your values may be different. ###
export CR_HOST=<cr-host-domain-name>
export CR_HOST_USERNAME=<cr-your-username>
export CR_HOST_NAMESPACE=<cr-your-namespace>
export CR_APP_API_KEY_RO_PULL=<cr-read-only-pull-api-key>
export CR_APP_API_KEY_RW_PUSH=<cr-read-write-push-api-key>
##################################
```
#### ENV open horizon
The Hybrid Cloud Mesh - RHSI implementation uses open-horizon (an OSS) to deploy RHSI (skupper) pods. Following ENVs relate with that.   

**File:** env-app-hzn
```
export HZN_ORG_ID=<hzn-org-id>
export HZN_EXCHANGE_USER_AUTH="ohuser:<api-key>"
```
#### ENV application specific
NAMESPACE is set as an argument while building, pushing and deploying the app. `make <target> NAMESPACE=<namespace>`

**File:** env-app-kube-deploy
```
# backend pod relica count. Usually 3
export K_REPLICAS_BACK=<3>
# backend service port. Port number your choice.
export K_PORT_BACK=<8089>
# An identifiable name of the backend service. Arbitrary.
export K_NAME_BACK=<test-backend-sg>
# Same name as above. Used by the k8s selector
export K_LABEL_APP_BACK=<test-backend-sg>
# An identifiable image name, Arbitrary.
export K_IMAGE_NAME_BACK=<image-backend-sg>
# An identifiable name., Arbitrary
export K_IMAGE_PULL_SECRET_NAME_BACK=<image-pull-secret-for-the-backend-image>

# frontend pod relica count. 1
export K_REPLICAS_FRONT=1
# frontend service port. Port number your choice.
export K_PORT_FRONT=<8089>
# An identifiable name of the frontend service. Arbitrary.
export K_NAME_FRONT=<test-frontend-sg>
# Same name as above. Used by the k8s selector
export K_LABEL_APP_FRONT=<test-frontend-sg>
# An identifiable image name, Arbitrary.
export K_IMAGE_NAME_FRONT=image-frontend-sg
# An identifiable name., Arbitrary
export K_IMAGE_PULL_SECRET_NAME_FRONT=<image-pull-secret-for-the-frontend-image>
# Important. Frontend servcie needs to call backend same as set earler.
export K_URL_BACK=${K_NAME_BACK}
```
### 2. Build, push and deploy application 
make` command builds the images, pushes into contaienr registry and deploys the application into the NAMESPACE as specified.
```
make -C src/backend NAMESPACE=<backtend-namespace-to-deploy-application-in>
make -C src/frontend NAMESPACE=<frontend-namespace-to-deploy-application-in>
```

### Reference:
https://www.ibm.com/docs/en/hybrid-cloud-mesh?topic=previews-working-red-hat-service-interconnect

### Author:
Sanjeev Gupta (sanjeev@ibm.com)

