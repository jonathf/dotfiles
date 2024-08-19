function awslogin --description 'log into aws with'
  if test -n $argv[1]
    set -x AWS_PROFILE $argv[1]
  end
  if test -z $AWS_PROFILE
    set -x AWS_PROFILE ds-pu
  end
  echo "Logging in with '$AWS_PROFILE' fish"
  aws sso login --profile $AWS_PROFILE
  # aws codeartifact login --tool pip --repository machine-learning --domain datascience --domain-owner 621389033208 --region eu-west-1
  set -x CODEARTIFACT_AUTH_TOKEN (aws codeartifact get-authorization-token --domain datascience --domain-owner 621389033208 --region eu-west-1 --query authorizationToken --output text)
  set -x PIP_INDEX_URL https://aws:$CODEARTIFACT_AUTH_TOKEN@datascience-621389033208.d.codeartifact.eu-west-1.amazonaws.com/pypi/machine-learning/simple/

  set AWS_SESSION_EXPIRATION (jq -r '.["expiresAt"]' ~/.aws/sso/cache/557ea8f55ae67abbefea8d6ffc1948e5af4e4eb2.json)
end
