# Marimo Site Test

## Goal

The goal of this project is to assess how feasible it is to use [marimo](https://marimo.io/) for custom reporting.

## Method

In this repo there are three subdirectories: `cool_report`, `fake_api`, and `lame_report`. The structure for each directory is pretty much exactly the same.

```sh
lame_report
├── Dockerfile 
├── Makefile
├── k8s-config.yaml
├── report.py
└── requirements.txt
```

The `report.py`, `requirements.txt`, and `Dockerfile` could theoretically be anything, I think? To prove that point, and to help with debugging, `fake_api` is a simple Flask app instead of a marimo report. Everything else should be the same, though.

In the top level directory, we have `ingress.yaml`, `Makefile`, and this very `README.md`. The `Makefile` is used in conjunction with each project's `Makefile` to build the Docker images and apply the K8s config. The top level `Makefile` also has an `apply_ingress` task that applies the configuration found in `ingress.yaml`.

To get up and running, in theory you should be able to:

```
make build
make deploy_reports
make apply_ingress
```

If you then go to `http://localhost/lame_report`, you should see a marimo report!

## Outcome

Well... it's not working and I'm not sure why? I _think_ something is wrong with the way that I'm defining the ports? It seems like things work if I do something like `kubectl port-forward service/lame-report 8069:80`, but I'm unable to actually access the reports via localhost otherwise. There may also be something incorrect with the way that the subdirectory Makefiles are building or tagging the images? It seems like `fake-api` is stuck in an `ImagePullBackOff` status, according to `kubectl get pods`.