# Snyk Infrastructure as Code - Azure Resource Manager (ARM)

The Snyk Infrastructure as Code product can scan ARM templates for configuration issues.

[ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager) files can be a mix of JSON or Bicep formats.

## Demo

This repository contains a mix of valid configuration files, which contain a range of configuration issues.

You can see the results by running
`snyk iac test .`

A snippet of the output looks as follows

```bash
-------------------------------------------------------

Testing wordpress.json...


Infrastructure as code issues:
  ✗ SAS token can be used over insecure HTTP [Medium Severity] [SNYK-CC-TF-244] in Storage
    introduced by resources[2] > properties > supportsHttpsTrafficOnly


Organization:      yair.zohar
Type:              ARM
Target file:       wordpress.json
Project name:      snyk-iac-arm
Open source:       no
Project path:      snyk/snyk-iac-arm

Tested wordpress.json for known issues, found 1 issues


Tested 7 projects, 5 contained issues.
```

## Testing Bicep files

In addition to the JSON ARM template files, this repository contains a directory with the same ARM configurations but in Bicep format.

You can easily test Bicep files by following the next steps:
1. Make sure you have the Bicep CLI installed
2. Using the Bicep CLI, convert the file format from Bicep to JSON by running the command `az bicep build -f {file_name}.bicep`
3. Test the converted file by running `snyk iac test {file_name}`

```bash
yairzohar@Yairs-MBP bicep % az bicep build -f wordpress.bicep
yairzohar@Yairs-MBP bicep % snyk iac test wordpress.json

Testing wordpress.json...


Infrastructure as code issues:
  ✗ SAS token can be used over insecure HTTP [Medium Severity] [SNYK-CC-TF-244] in Storage
    introduced by resources[2] > properties > supportsHttpsTrafficOnly


Organization:      yair.zohar
Type:              ARM
Target file:       wordpress.json
Project name:      bicep
Open source:       no
Project path:      wordpress.json

Tested wordpress.json for known issues, found 1 issues
```