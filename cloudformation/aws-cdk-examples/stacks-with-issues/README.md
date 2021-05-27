### AWS CDK Typescript Examples

#### Prerequisites
- Run `npm install -g aws-cdk` to install the AWS CDK CLI tool.

This directory contains AWS CDK Stacks written in TypeScript. To scan them with Snyk, you need to follow these steps:

- Run `npm i` in the stack directory to install dependencies
- Run `cdk synth` to synthesize a CloudFormation template. This will be printed in your display in YAML by default. To print it in JSON, append `--json`.

- (Optional) Run `cdk ls` to check the name of the Stack you just synthesized
- The `cdk.out/` directory is now created and it contains a `VpcStackWithIssues.template.json` file with the CloudFormation Template.
- Run `snyk iac test cdk.out/VpcStackWithIssues.template.json` and check out for any vulnerabilities!
- If you want to output it in a different directory, you can change the directory with the `--output` option, e.g.:
  `cdk synth --output=templates/`
