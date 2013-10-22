PROJECT = elevators
REBAR = rebar
REBARUP = rebar -C rebar.config.upgrade

all: rel1

app:
	@$(REBAR) compile

clean:
	@$(REBAR) clean

rel1: clean-release app
	@./relx -c rel1/relx.config release tar

rel2: clean app
	@./relx -c rel2/relx.config release relup tar

clean-release:
	rm -rf rel1/elevators rel2/elevators
