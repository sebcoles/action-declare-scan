# Veracode Declare Scan Action

This action runs the Declare `scan` action to scan the Veracode configuration described in the Declare file. For more information read the docs [here](https://sebcoles.github.io/Veracode.OSS.Declare/actions/scan/)!

### Pre-requisites

Create a workflow `.yml` file in your `.github/workflows` directory. An [example workflow](#example-workflow---create-a-release) is available below. For more information, reference the GitHub Help Documentation for [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

## Inputs

### `configuration-file`

**Required** The filepath to the Declare configuration file. Defaults to `veracode.json`

### `ignore-schedule`

**Required** The Declare configuration contains schedule information within `veracode.json`. If the current scan is within the schedule, Declare will skip the application profile. By default this is true (so the scan will run regardless of schedule). Setting this to false will honour the schedule.

### Example workflow - create a release
On every `push` to the main branch this will run the configure command against the Declare configuration. This will then add or update the Veracode configuration.

```yaml
on:
  push:
    branches:
      - main

name: Run Veracode Scan
jobs:
  build:
    name: Veracode Scan
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Configure Veracode
        uses: sebcoles/action-declare-configure@v1
        env:
          VERACODE_API_KEY_ID: ${{ secrets.VERACODE_API_KEY_ID }}
          VERACODE_API_KEY_SECRET: ${{ secrets.VERACODE_API_KEY_SECRET }} 
        with:
          configuration-file: "veracode.json"
          ignore-schedule: true
```