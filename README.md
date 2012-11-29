Elevators Demo
==============

Elevator control system demonstrating Erlang/OTP upgrades.

History
-------

I will need to ninja many people to fill that one in!

Quick start
-----------

 *  Make sure you have make and rebar installed and in your `$PATH`
 *  Type `make` to build everything
 *  Start the release with `./rel1/elevators/bin/elevators console`
 *  Make elevators move and notice they stop at each floor
 *  (Exercise: Find bugs, fix them and build a release upgrade)
 *  In the Erlang shell: `release_handler:unpack_release("elevators_2").`
 *  To upgrade: `release_handler:install_release("2").`
 *  To downgrade: `release_handler:install_release("1").`
 *  Stop the VM with `q().`

Troubleshooting
---------------

The current compilation process prepares the demo entirely, but doesn't
double check things. If something fails during the compilation or the
release generation, you might want to reset the working directory.
