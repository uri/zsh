aws_credentials_file() {
    dev aws export-credentials
}

aws_credentials_env() {
  if [ -v AWS_PROFILE ]; then 
    eval $(aws configure export-credentials --format env)
  else
   echo "AWS_PROFILE must be set"
   return 1
  fi
}
