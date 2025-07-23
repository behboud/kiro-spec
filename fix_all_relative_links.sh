#!/bin/bash

echo "Creating comprehensive link fixes..."

# Function to fix links in a file
fix_file_links() {
    local file="$1"
    echo "Fixing links in: $file"
    
    # Get the directory depth from spec-process-guide root
    local relative_depth=$(echo "$file" | sed 's|spec-process-guide/||' | sed 's|[^/]*||g' | sed 's|/|../|g')
    
    # Fix README.md references at different depths
    if [[ "$file" =~ spec-process-guide/[^/]+/[^/]+\.md$ ]]; then
        # Files in subdirectories (2 levels deep) 
        sed -i 's|\](../README\.md|\](README.md|g' "$file"
        sed -i 's|\](../methodology/README\.md|\](../methodology/README.md|g' "$file" 
        sed -i 's|\](../process/README\.md|\](../process/README.md|g' "$file"
        sed -i 's|\](../examples/README\.md|\](../examples/README.md|g' "$file"
        sed -i 's|\](../templates/README\.md|\](../templates/README.md|g' "$file"
        sed -i 's|\](../prompting/README\.md|\](../prompting/README.md|g' "$file"
        sed -i 's|\](../ai-reasoning/README\.md|\](../ai-reasoning/README.md|g' "$file"
        sed -i 's|\](../execution/README\.md|\](../execution/README.md|g' "$file"
        sed -i 's|\](../resources/README\.md|\](../resources/README.md|g' "$file"
    fi
    
    # Fix cross-references between subdirectories - all of these should work as written
    # since they're correctly relative paths within spec-process-guide
}

# Apply fixes to all files in spec-process-guide
find spec-process-guide -name "*.md" -type f | while read file; do
    fix_file_links "$file"
done

echo "Fixed relative links!"
