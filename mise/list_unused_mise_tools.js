#!/usr/bin/env node

/**
 * Lists all unused mise tools on the current directory. Keep in mind a unused tool on a certain
 * directory does NOT mean the tool isn't used somewhere else. For that reason the script doesn't
 * offer automatic removal. To remove the listed apps (in case you are 100% certain), run with:
 * mise uninstall $(./list_unused_mise_tools.js)
 */

const childProcess = require('child_process');

childProcess.exec('mise list', (error, stdout, stderr) => {
    if (error) {
        console.error(`exec error: ${error}`)
        return
    }

    lines = stdout.split("\n").filter(line => line.trim() !== "" )

    const unusedAppsRegExp = /^(\w+)\s+([\d\.]+)$/
    const unusedAppsMatches = lines
        .map(line => line.match(unusedAppsRegExp))
        .filter(match => match !== null)
    console.log(unusedAppsMatches.map(match => `${match[1]}@${match[2]}`).join(" "))
})