# reviewdog/action-setup

[![Test](https://github.com/reviewdog/action-setup/workflows/Test/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/reviewdog/action-setup/workflows/reviewdog/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Areviewdog)
[![depup](https://github.com/reviewdog/action-setup/workflows/depup/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Adepup)
[![release](https://github.com/reviewdog/action-setup/workflows/release/badge.svg)](https://github.com/reviewdog/action-setup/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/reviewdog/action-setup?logo=github&sort=semver)](https://github.com/reviewdog/action-setup/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

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
  - uses: reviewdog/action-setup@v1
  - run: reviewdog -version
```

### Specify reviewdog version
```yaml
steps:
  - uses: reviewdog/action-setup@v1
    with:
      reviewdog_version: v0.13.0
  - run: reviewdog -version
```

### Nightly
```yaml
steps:
  - uses: reviewdog/action-setup@v1
    with:
      reviewdog_version: nightly
  - run: reviewdog -version
```
