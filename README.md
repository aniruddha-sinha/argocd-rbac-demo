# Argo CD RBAC Demo

This document will be changed later but for now; I will feed in the details and steps to work on


1. Install Argocd : 
`https://github.com/aniruddha-sinha/argocd-rbac-demo/blob/main/final.yaml`

2. Retrieve the initial admin secret `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

3. Login to the argocd CLI using the following `argocd login localhost:8443 --username admin --password HcTgb3b8F9RLn6iE`

4. Change password `argocd account update-password --account admin --current-password <initial-admin-password> --new-password <some-new-password>`

5. Now using the code `https://github.com/aniruddha-sinha/argocd-rbac-demo.git` / scripts / final.yaml, deploy the applications using `kubectl apply -f final.yaml

6. Create two users, `developer` and `devlead` using the following config in the argocd config map provided under the data: here `https://github.com/aniruddha-sinha/argocd-rbac-demo/blob/main/argocd-users/argocm.yaml`

7. Once users are created, verify their creation using the command `argocd account list`

8. change the password of both the users using the following command (you will need to be an admin user to do this); 

  ```shell
  argocd account update-password \
--account developer \
--current-password rexo-c-1003 \
--new-password rexo-dev-1003
```

```shell
argocd account update-password \
--account devlead \
--current-password rexo-c-1003 \
--new-password rexo-prod-1003
```

```shell
argocd account update-password \
--account platformlead \
--current-password rexo-c-1003 \
--new-password rexo-platform-1003
```

9. Once everything is applied you can simply login and check the authorization status. 