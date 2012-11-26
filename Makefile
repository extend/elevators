PROJECT = elevators
REBAR = rebar
REBARUP = rebar -C rebar.config.upgrade

all: upgrade

app:
	@$(REBAR) compile

clean:
	@$(REBAR) clean

release: clean-release app
	@$(REBAR) generate
	mv rel1/elevators/releases/1/elevators.boot rel1/elevators/releases/1/start.boot
	ln -s start.boot rel1/elevators/releases/1/elevators.boot

clean-release:
	rm -rf rel1/elevators rel2/elevators

upgrade: clean release
	mv src/elevators.app.src src/elevators.app.src.v1
	mv src/scheduler.erl src/scheduler.erl.v1
	cp upgrade/elevators.app.src src/
	cp upgrade/scheduler.erl src/
	@$(REBARUP) compile generate
	cp upgrade/elevators.appup rel2/elevators/lib/elevators-1.1/ebin/
	@$(REBARUP) generate-upgrade previous_release=../rel1/elevators
	mv rel2/elevators_2.tar.gz rel1/elevators/releases/
	mv src/elevators.app.src.v1 src/elevators.app.src
	mv src/scheduler.erl.v1 src/scheduler.erl
