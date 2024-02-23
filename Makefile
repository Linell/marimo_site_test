# Define service names explicitly
SERVICES := cool_report lame_report fake_api

# Define default target
.PHONY: all
all: build start

# Define build step for all services
.PHONY: build
build: $(addsuffix .build, $(SERVICES))

# Define start step for all services
.PHONY: start
start: $(addsuffix .start, $(SERVICES))

# Define stop step for all services
.PHONY: stop
stop: $(addsuffix .stop, $(SERVICES))

# Suffix rules for build, start, and stop
%.build:
	$(MAKE) -C $* build

%.start:
	$(MAKE) -C $* start

%.stop:
	$(MAKE) -C $* stop

# Clean target for removing all built docker images and containers
.PHONY: clean
clean:
	@for service in $(SERVICES) ; do \
		$(MAKE) -C $$service clean; \
	done

.PHONY: deploy_reports
deploy_reports:
	@for service in $(SERVICES) ; do \
		echo "Deploying $$service..."; \
		$(MAKE) -C $$service deploy; \
	done

.PHONY: delete_reports
delete_reports:
	@for service in $(SERVICES) ; do \
		echo "Deleting $$service..."; \
		$(MAKE) -C $$service delete; \
	done

.PHONY: apply_ingress
apply_ingress:
	kubectl apply -f ingress.yaml

.PHONY: delete_ingress
delete_ingress:
	kubectl delete -f ingress.yaml