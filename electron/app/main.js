const {app, BrowserWindow} = require("electron");
const path = require("path");

function createWindow () {
  const mainWindow = new BrowserWindow({
    webPreferences: {
      preload: path.join(__dirname, "preload.js")
    }
  });

  mainWindow.loadFile("index.html");
}

app.whenReady().then(() => {
  createWindow();
});
