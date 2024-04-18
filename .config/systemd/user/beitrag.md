I am struggling heavily with writing a systemd service which executes `git push origin  BRANCH` on shutdown and beg for your help. The service is located in `/localhome/USER/.config/systemd/user` (yes, `$HOME`=`/localhome/USER`) and enabled via `systemctl --user enable push-repos.service`. 'Executing' the service manually with `systemctl --user start push-repos.service` works but after a normal shutdown, nothing was pushed.
In case there is no internet connection, the service has to be terminated to avoid any blocking of `git push`, hence I am using `TimeoutSec`.

The service so far:
```systemd
[Unit]
Description=Push repositories.
DefaultDependencies=no
Before=shutdown.target

[Service]
Type=oneshot
ExecStart=~/proj/scripts/push-repos.sh # See below
TimeoutSec=20

[Install]
RequiredBy=shutdown.target
```

`~/proj/scripts/push-repos.sh`:
I don't care for any conflicts on `origin/dlr` (in theory there should be none), conceptually, it is more of a "try to push".
```sh
for dir in "repo1" "repo2" "repo3"; do
	cd /localhome/USER/$dir
	git checkout dlr
	git add .
	git commit -m "Lorem Ipsum"
        git push origin dlr
done
```
