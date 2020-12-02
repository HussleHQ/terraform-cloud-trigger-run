# Terraform Cloud trigger run

This action trigger a Terraform Cloud workspace run

## Inputs

#### `tf-token` 
**Required** An API token for Terraform Cloud..

#### `workspace-name` 
**Required** The Terraform Cloud workspace to update.

#### `org-name` 
**Required** The Terraform Cloud organization the workspace belongs to.

## Example usage 

```
uses: HussleHQ/terraform-trigger-cloud-run@v1
with:
  tf-token: ${{ secrets.TF_TOKEN }}
  workspace-name: ${{ env.WORKSPACE_NAME }}
  org-name: ${{ env.ORG_NAME }}
```

## Release

```
# git add as per usual

git tag -a -m 'Thousands of gyms. Zero contracts.' v1.1
git push origin v1.1
```

#### Gotcha
> GitHub actions currently are only resolving to exact versioning. Meaning for a new patch release you'll have to overwrite the current minor release with it.

```
# This is just for logging purposes, and is not actually used.
git tag -a -m 'Thousands of gyms. Zero contracts.' v1.2.3
git push origin v1.2.3

# Version Used by clients
git tag --delete v1.2
git push origin --delete v1.2
git tag -a -m 'Patch release message' v1.2
git push origin v1.2
```
