## Bolt playground

This setup is enough to bootstrap a host with puppet and install `ipcalc`.


## Assumptions

* Currently only tested on Debian Stretch.
* You can ssh to `debian@<ip>`
* `debian` user has sudo access without a password

If you have sudo password set then pass `--sudo-password` to `bolt plan run` and it should prompt you for the password.


To run:

```bash
git clone https://github.com/cornet/bolt-puppet-playground.git
bundle install
cd bolt-puppet-playground
bolt puppetfile install
```

To apply the plan which will install puppet and install ipcalc:
```bash
bolt plan run profiles::ipcalc --user debian --run-as root --nodes <ip> --verbose
```

Currently the above needs running twice as the first time seems to only install puppet then bails out

```
Finished: plan profiles::ipcalc in 126.51 sec
{
  "kind": "bolt/apply-prep",
  "msg": "service could not be found",
  "details": {
  }
}
```

On the 2nd run you should get:
```
Finished: apply catalog with 0 failures in 43.82 sec
Finished: plan profiles::ipcalc in 47.94 sec
Plan completed successfully with no result
```
