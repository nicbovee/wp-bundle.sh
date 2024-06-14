# wp-bundle.sh

### A simple shell script for bundling WordPress plugins and themes using gitignore to exclude files and directories.

---

## Installation

Put the script in the root directory of your WordPress plugin or theme. Run `chmod +x bundle.sh` to make it executable.

## Usage

This script is intended for plugins and themes that don't use a bundler for deployment and instead get uploaded to the site manually.

1. Ensure that the `.gitignore` file is set up to exclude files and directories that shouldn't be included in the bundle. You'll want to exclude things like `.git`, `node_modules`, and other development files but include any of your bundled assets.

2. Bump your plugin or theme version in the main file (e.g. `style.css` for themes or the main plugin file for plugins).

3. Run the script with the following command:

```bash
bundle.sh
```

Alternatively you could include this in any other build commands you have to ensure that everything else is finished before bundling.

```bash
// package.json
{
  "scripts": {
    "build": "npm run build:css && npm run build:js && ./bundle.sh"
  }
}
```

This will produce a zip with the same name as the directory that can be installed on the WordPress site.
