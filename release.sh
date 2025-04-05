#!/bin/bash

# Read the version string from info.json
TAG_NAME=$(jq -r '.version' info.json)

# Check if the version was found
if [ -z "$TAG_NAME" ]; then
  echo "Error: Version not found in info.json"
  exit 1
fi

# Check if the tag exists locally
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
  echo "Tag $TAG_NAME exists locally."
else
  echo "Tag $TAG_NAME does not exist locally. Proceeding with tag creation."
fi

# Check if the tag exists remotely
if git ls-remote --tags origin "$TAG_NAME" | grep -q "$TAG_NAME"; then
  echo "Error: Tag $TAG_NAME already exists remotely."
  exit 1
fi

# Print the version and ask for confirmation
echo "The version to be published is: $TAG_NAME"
read -r -p "Do you want to proceed with this version? Type 'Y' to confirm: " CONFIRMATION

# Check if the user confirmed
if [ "$CONFIRMATION" != "Y" ]; then
  echo "Operation cancelled."
  exit 0
fi

# Create the tag
echo "Creating tag $TAG_NAME..."
git tag "$TAG_NAME"

# Push the tag to the remote repository
echo "Pushing tag $TAG_NAME to origin..."
git push origin "$TAG_NAME"

echo "Tag $TAG_NAME pushed successfully!"
