# app-service-tracker

Service Tracker is a sample application that displays a dashboard of weather,
flights, and earthquakes. It is defined in accordance with the [OAM v1alpha2
specification](https://github.com/oam-dev/spec).

## Requirements

`app-service-tracker` requires that Crossplane, at least one provider, and one
of the two OAM addons be installed. You may also install a stack for one of the
providers to define some basic resource classes. Options for each are listed
below:

**Providers**

- [provider-azure](https://github.com/crossplane/provider-azure)
- [provider-alibaba](https://github.com/crossplane/provider-alibaba)
- [provider-gcp](https://github.com/crossplane/provider-gcp)
- [provider-aws](https://github.com/crossplane/provider-aws)

**Stacks**

- [stack-azure-sample](https://github.com/crossplane/stack-azure-sample)
- [stack-gcp-sample](https://github.com/crossplane/stack-gcp-sample)
- [stack-aws-sample](https://github.com/crossplane/stack-aws-sample)

**OAM Addons**

- [addon-oam-kubernetes-local](https://github.com/crossplane/addon-oam-kubernetes-local)
- [addon-oam-kubernetes-remote](https://github.com/crossplane/addon-oam-kubernetes-remote)

## Install

To install `app-service-tracker`, use a `StackInstal`:

```yaml
apiVersion: stacks.crossplane.io/v1alpha1
kind: StackInstall
metadata:
  name: "service-tracker-sample"
  namespace: crossplane-system
spec:
  package: "crossplane/app-service-track:<version>"
```

## Usage

To create an instance of the app, create a `ServiceTracker`:

```yaml
apiVersion: oam.apps.crossplane.io/v1alpha1
kind: ServiceTracker
metadata:
  name: service-tracker
spec:
  weatherAPIReplicas: 3
```

## Build

`make build`

## Developing Locally

`app-service-tracker` can be tested locally by installing
[Kind](https://kind.sigs.k8s.io/) and
[Crossplane](https://crossplane.io/docs/v0.9/install.html), then running the
following commands:

```
kind create cluster
make build
kind load docker-image crossplane/stack-oam:local
kubectl apply -f install.yaml
kubectl apply -f example.yaml
```
