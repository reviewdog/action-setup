# reviewdog/action-setup

[![Test](https://github.com/reviewdog/action-setup/workflows/Test/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/reviewdog/action-setup/workflows/reviewdog/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/reviewdog/action-setup/workflows/depup/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Adepup)
[![release](https://github.com/reviewdog/action-setup/workflows/release/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/reviewdog/action-setup?logo=github&sort=semver)](https://github.com/reviewdog/action-setup/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)
[![Used-by counter](https://img.shields.io/endpoint?url=https://haya14busa.github.io/github-used-by/data/reviewdog/action-setup/shieldsio.json)](https://github.com/haya14busa/github-used-by/tree/main/repo/reviewdog/action-setup)

This action installs :dog: [reviewdog](https://github.com/reviewdog/reviewdog).

## Input
```yaml
inputs:
  reviewdog_version:
    description: 'reviewdog version. [latest,nightly,vX.Y.Z]'
    default: 'latest'
```

## Usage

### Latest
```yaml
steps:
  - uses: reviewdog/action-setup@d8edfce3dd5e1ec6978745e801f9c50b5ef80252 # v1.4.0
  - run: reviewdog -version
```

### Specify reviewdog version
```yaml
steps:
  - uses: reviewdog/action-setup@d8edfce3dd5e1ec6978745e801f9c50b5ef80252 # v1.4.0
    with:
      reviewdog_version: v0.21.0
  - run: reviewdog -version
```

### Nightly
```yaml
steps:
  - uses: reviewdog/action-setup@d8edfce3dd5e1ec6978745e801f9c50b5ef80252 # v1.4.0
    with:
      reviewdog_version: nightly
  - run: reviewdog -version
```
