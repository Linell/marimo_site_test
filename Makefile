# Define service names explicitly
SERVICES := cool_report lame_report

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