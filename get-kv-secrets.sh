set -e

# set variables
subscriptionId="TODO"
kvName="TODO"


# set correct subscription
az account set -s $subscriptionId

# get kv entries
az keyvault secret list --vault-name $kvName --query "[].{secretId:id,secretName:name}" -o tsv |
while read -r secretId secretName; do
    value=$(az keyvault secret show --id $secretId --query "value" -o tsv)
    echo "${secretName}\n${value}\n"
done

