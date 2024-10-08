#!/bin/sh

# Log some info we might need to troubleshoot.
ls /workspaces > ~/postAttachCommands.log
env >> ~/postAttachCommands.log

# Change the backend port visibility to public...
gh codespace ports -c $CODESPACE_NAME >> ~/postAttachCommands.log
gh codespace ports visibility 7072:public -c $CODESPACE_NAME
gh codespace ports -c $CODESPACE_NAME >> ~/postAttachCommands.log

# ... and update our envrionment.ts file with the new public URL.
ADDRESS=`gh codespace ports -c $CODESPACE_NAME --json label,browseUrl | jq -r '.[] | select(.label == "backend").browseUrl'`
sed -i 's|http://localhost:7072|'$ADDRESS'|g' $CODESPACE_VSCODE_FOLDER/ContosoAIAppsFrontend/src/environments/environment.ts
