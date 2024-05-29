### Hierarchy of a beaker Job

> Job > Recipe Set > Recipe > Task

A Job is an top-level instantiated unit of work,
it can contain multiple independent Recipe Sets.

A Recipe Sets is a collection of multiple Recipes
that run in paralle.

A Recipe is a series of Tasks that run in sequence,
while a Task is the minimal unit fo work.

### Architecture of a beaker installation

The server provides the web ui and coordinates the
reservation of devices and execution of tasks.

The lifecycle of devices and task execution is
conducted by lab controllers scattered across
datacenters.

When devices boot up after provisioning, a embedded
agent (Tests Harness) reports back to the lab controller,
and fetches/executes the tasks. (Or we can use a custom
harness that conforms to the API specification)

Beaker currently handles system provision through PXE booting
(for the initial operating system installation) and Anaconda
kickstart files automatically generated by the lab controller.

To handle power cycling and rebooting systems, Beaker requires
remote power control. This is handled through the use of
"power scripts", which must be installed locally on the lab controller. 
The provided ones interacts with ipmi, but can be replaced by
user provided ones (e.g. jumpstarter)

Special inventory task can be used to probe hardwares on DUT.
