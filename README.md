# Cookiecutter SAM for Python Lambda functions

This is a [Cookiecutter](https://github.com/audreyr/cookiecutter) template to create a Serverless App based on Serverless Application Model (SAM) and Python 3.9.

It is important to note that you should not try to `git clone` this project but use `SAM` CLI instead as ``{{cookiecutter.project_slug}}`` will be rendered based on your input and therefore all variables and files will be rendered properly.

## Usage

To initialise the project run the following command:

```
sam init --location gh:cabinetoffice/gpa-datahub-lambda-template
```

### First run

Build your lambda function read for deployment

`sam build`

Create the infrastructure for each env (dev/stage/prod etc)

`sam build && sam deploy --guided --capabilities CAPABILITY_NAMED_IAM`

Sample deployment settings

```
Configuring SAM deploy
======================

Looking for config file [samconfig.toml] :  Not found

Setting default arguments for 'sam deploy'
=========================================
Stack Name [sam-app]: datahub-samplefunction-dev
AWS Region [eu-west-2]:
Parameter ProjectName [datahub-samplefunction]:
Parameter DeploymentEnvironment [local]: dev
#Shows you resources changes to be deployed and require a 'Y' to initiate deploy
Confirm changes before deploy [y/N]:
#SAM needs permission to be able to create roles to connect to the resources in your template
Allow SAM CLI IAM role creation [Y/n]:
#Preserves the state of previously provisioned resources when an operation fails
Disable rollback [y/N]:
Save arguments to configuration file [Y/n]:
SAM configuration file [samconfig.toml]:
SAM configuration environment [default]: dev
```

You should now have your environment configuration setup.

Use the following below to deploy to your new environment

`sam deploy --no-confirm-changeset --no-fail-on-empty-changeset --config-env dev`

#### Modifying the pipeline

There is an example Github action file that can be modified to automatically deploy your lambda function based on which branch is being worked on.

1. Rename `.github/workflows-example` to `.github/workflows`
2. Rename `sam-pipeline-example.yml` to `sam-pipeline-$YOUR_ENV.yml`
3. Update any `$` reference with your own values
   1. `$YOUR_ENV` - `dev/stage/prod`. Ensure branch name matches env name.
   2. `$ROLE_TO_ASSUME` - ARN of the role that was created when you ran `sam deploy` above.

Add your changed pipeline to  git and push to Github. Your pipeline should now be active.

## Options

Option | Description
------------------------------------------------- | ---------------------------------------------------------------------------------
`include_safe_deployment` | Sends by default 10% of traffic for every 1 minute to a newly deployed function using [CodeDeploy + SAM integration](https://github.com/awslabs/serverless-application-model/blob/master/docs/safe_lambda_deployments.rst) - Linear10PercentEvery1Minute

# Credits

* This project has been generated with [Cookiecutter](https://github.com/audreyr/cookiecutter)
* [Bruno Alla's Lambda function template](https://github.com/browniebroke/cookiecutter-lambda-function)

License
-------

This project is licensed under the terms of the [MIT License with no attribution](/LICENSE)
