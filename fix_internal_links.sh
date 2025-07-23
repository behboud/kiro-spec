#!/bin/bash

echo "Fixing internal links within spec-process-guide directory..."

# Create a function to fix relative paths that go back to parent but should stay within spec-process-guide
fix_internal_relative_links() {
    local file="$1"
    echo "Processing: $file"
    
    # Create a backup
    cp "$file" "$file.bak"
    
    # Fix links that reference ../../README.md to go to the main README.md
    sed -i 's|\](../../README\.md|\](../../README.md|g' "$file"
    
    # Fix relative links going up directories but staying within spec-process-guide
    sed -i 's|\](../methodology/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../process/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../examples/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../templates/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../prompting/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../ai-reasoning/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../execution/README\.md|\](README.md|g' "$file"
    sed -i 's|\](../resources/README\.md|\](README.md|g' "$file"
    
    # Keep properly formed relative links as they are
    # Only change the ones that are clearly broken
}

# Find all markdown files in spec-process-guide and fix their internal links
find spec-process-guide -name "*.md" -type f | while read file; do
    fix_internal_relative_links "$file"
done

echo "Internal links fixed!"
