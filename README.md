# balena-wayland-electron

A sample app for running Electron using Wayland on [Balena](https://www.balena.io).

## Important

If the Electron app crashes, try using another Electron version (`electron/app/package.json`)
and update the lock file (using `npm install` in the `electron/app` folder). While for me Electron 17 crashed using Wayland,
I've got reports that Electron 17 works and 16 crashes.
