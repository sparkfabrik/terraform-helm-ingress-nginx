# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.7.0] - 2024-09-09

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.6.0...0.7.0)

### Changed

- Update to use Ingress-nginx 1.11.2 to solve [CVE-2024-7646](https://github.com/kubernetes/kubernetes/issues/126744).

## [0.6.0] - 2024-05-29

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.5.2...0.6.0)

### Changed

- ⚠️ BREAKING CHANGE: use `topologySpreadConstraints` instead of `podAntiAffinity` for better control over pod distribution.

If you have not set the old `set_controller_default_pod_anti_affinity` varible, you can safely upgrade to this version. Otherwise, you can turn off the `topologySpreadConstraints` feature by setting the new `set_controller_default_topology_spread_constraints` to `false`.

## [0.5.2] - 2024-05-15

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.5.1...0.5.2)

### Changed

- Fix `controller.autoscaling.enabled` default value removing quotes.

## [0.5.1] - 2024-05-13

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.5.0...0.5.1)

### Changed

- Fix `podAntiAffinity` configuration.

## [0.5.0] - 2024-05-13

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.4.0...0.5.0)

### Added

- Default value for chart version. The values file shipped with the module refers to the declared version of the chart.
- `podAntiAffinity` configuration enabled by default. It is possible to disable it by setting the new `set_default_pod_anti_affinity` variable to `false`.
- Add the `common_labels` variable to allow the user to set common labels for all resources created by the chart.
- Add the `ingress_nginx_controller_min_replicas` and `ingress_nginx_controller_max_replicas` variables to easily set the minimum and maximum number of replicas for the controller pods.

## [0.4.0] - 2023-12-22

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.3.0...0.4.0)

### Changed

- Feature: add `ssl-redirect` configuration.
- Feature: add requests in `defaultBackend`.

## [0.3.0] - 2023-12-19

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.2.2...0.3.0)

### Changed

- Feature: turn off metrics by default.

## [0.2.2] - 2023-12-05

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.2.1...0.2.2)

### Changed

- Fix typo on `values.yaml`.

## [0.2.1] - 2023-12-05

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.2.0...0.2.1)

### Changed

- Removed `helm` provider config and variables.

## [0.2.0] - 2023-12-05

[Compare with previous version](https://github.com/sparkfabrik/terraform-helm-ingress-nginx/compare/0.1.0...0.2.0)

### Changed

- `annotations-prefix` removed from values file.
- `values.yaml` moved into `files` directory.

## [0.1.0] - 2023-12-04

- First release.
