Elevators Demo
==============

Elevator control system demonstrating Erlang/OTP upgrades.

History
-------

Originally written by Håkan Huss in the late 90s at Erlang Systems.

It was part of the 5-day Erlang Literacy course aimed at test and
support staff of the GPRS project. It was used as a lab exercise
in several parts of the course to practise different topics such
as behaviours, supervisors, release handling, etc. The first exercise
using the elevator example was the mentioned "bug" that the elevator
always stopped at every floor (it is actually not a bug, but an
elevator scheduler which is trivially guaranteed to fulfill the
requirements on elevator scheduling used in the example). Several
refinements of the scheduling were made in the course lab exercises.

Since the purpose of the exercise was to use many different aspects
of Erlang and OTP, the code has been written to use many behaviours
rather than to be the "best" solution for the problem. The resulting
architecture should still be pretty good, though.

It has also been used to demonstrate how Quick Check can test
elevator systems, and featured in a few academic papers.

Thanks go to Francesco Cesarini and Håkan Huss for the historical
informations.

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
