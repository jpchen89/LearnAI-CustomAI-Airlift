# You can use this script to export a folder (containing notebooks, or
# folders of notebooks) from ADB as a DBC archive, so you can then
# unzip the archive and add the individual notebooks to version
# control.  Adding the notebooks individually enables text-based
# version control, which makes it easier to see the actual changes to
# notebooks.

USERNAME=wopauli@microsoft.com

REGION=westus

FILE=token.txt

if [ -f $FILE ]; then
    echo "Token file $FILE exists."
    token=$(cat $FILE)
else
    echo "Token file $FILE does not exist."
    exit 1
fi


echo "Using access token: $token"

# curl -n -o notebooks.dbc   https://${REGION}.azuredatabricks.net/api/2.0/workspace/export\?path=/Users/$USERNAME/notebooks\&direct_download=true\&format=DBC -H "Authorization: Bearer ${token}"

curl -n -o my.ipynb https://westus.azuredatabricks.net/api/2.0/workspace/export\?path=/Users/wopauli@microsoft.com/notebooks/day_2/02_random_forests\&direct_download=true\&format=JUPYTER -H "Authorization: Bearer ${token}"

# Here are some further instructions

# To extract the content of the archive, simply use unzip:
# > unzip notebooks.dbc

# To create a dbc archive of folders, just create a zip file without compressing python notebooks (-n option)
# > zip -r -n python notebooks.dbc notebooks

# To import this new archive into databricks, use curl again
# >
#curl -n -F path=/Users/${USERNAME}/notebooks -F format=DBC -F content=@notebooks.dbc https://${REGION}.azuredatabricks.net/api/2.0/workspace/import  -H "Authorization: Bearer ${token}"
