env_var_setup = $(if $($1),,$(error $1 is not set. $2, e.g. export $1=$3))

$(call env_var_setup,K_REPLICAS_BACK,Set number of pod relicas,<3>)
$(call env_var_setup,K_PORT_BACK,Set service port,<8080>)
$(call env_var_setup,K_NAME_BACK,Set deployment and pod name prefix,<backend-sg>)
$(call env_var_setup,K_LABEL_APP_BACK,Set label for the selector,<backend-sg>)
$(call env_var_setup,K_IMAGE_NAME_BACK,Set image name for the deployment,<image-backend-sg>)
$(call env_var_setup,K_IMAGE_PULL_SECRET_NAME_BACK,Set image pull secret name from container registry,<mesh-poc-image-pull-back-sec>)

$(call env_var_setup,K_REPLICAS_FRONT,Set number of pod relicas,<1>)
$(call env_var_setup,K_PORT_FRONT,Set service port,<8080>)
$(call env_var_setup,K_NAME_FRONT,Set deployment and pod name prefix,<frontend-sg>)
$(call env_var_setup,K_LABEL_APP_FRONT,Set label for the selector,<frontend-sg>)
$(call env_var_setup,K_IMAGE_NAME_FRONT,Set image name for the deployment,<image-frontend-sg>)
$(call env_var_setup,K_IMAGE_PULL_SECRET_NAME_FRONT,Set image pull secret name from container registry,<mesh-poc-image-pull-front-sec>)
$(call env_var_setup,K_URL_BACK,Set backend service url,<backend-sg>)





