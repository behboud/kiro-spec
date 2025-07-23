#!/bin/bash

echo "=== BROKEN LINKS ANALYSIS ==="
echo

# Find all markdown files and extract links
rg '\[[^\]]*\]\(([^)]*\.md[^)]*)\)' --type md -o --replace '$1' --no-filename | sort -u | while IFS= read -r link; do
    # Skip external links
    if [[ "$link" =~ ^https?:// ]]; then
        continue
    fi
    
    # Remove anchors for file existence check
    file_path="${link%#*}"
    
    # Try to find if the file exists in the project
    found=false
    
    # Check if it's an absolute path from root
    if [[ -f "$file_path" ]]; then
        found=true
    # Check if it's relative to spec-process-guide
    elif [[ -f "spec-process-guide/$file_path" ]]; then
        found=true
    # Check if it exists anywhere in the project with same filename
    else
        basename_file=$(basename "$file_path")
        if find . -name "$basename_file" -type f | grep -q .; then
            found=true
            echo "MISPLACED: $link -> $(find . -name "$basename_file" -type f | head -1)"
        fi
    fi
    
    if [[ "$found" == "false" ]]; then
        echo "MISSING: $link"
    fi
done

echo
echo "=== FILES THAT REFERENCE NON-EXISTENT FILES ==="
echo

# Now find which files contain broken links
rg '\[[^\]]*\]\(([^)]*\.md[^)]*)\)' --type md -H | while IFS=: read -r file_path match; do
    # Extract the link from the match
    link=$(echo "$match" | sed -n 's/.*\](\([^)]*\.md[^)]*\)).*/\1/p')
    
    # Skip external links
    if [[ "$link" =~ ^https?:// ]]; then
        continue
    fi
    
    # Remove anchors for file existence check
    file_only="${link%#*}"
    
    # Get directory of the file containing the link
    dir_path=$(dirname "$file_path")
    
    # Try to resolve the link relative to the file's directory
    if [[ "$link" =~ ^/ ]]; then
        # Absolute path
        target_path=".$link"
    else
        # Relative path
        target_path="$dir_path/$file_only"
    fi
    
    # Normalize the path
    target_path=$(realpath -m "$target_path" 2>/dev/null || echo "$target_path")
    
    # Check if target exists
    if [[ ! -f "$target_path" ]]; then
        basename_file=$(basename "$file_only")
        # Check if file exists elsewhere
        actual_location=$(find . -name "$basename_file" -type f | head -1)
        if [[ -n "$actual_location" ]]; then
            echo "BROKEN LINK in $file_path: '$link' -> should be: '$(realpath --relative-to="$dir_path" "$actual_location")'"
        else
            echo "BROKEN LINK in $file_path: '$link' -> FILE NOT FOUND"
        fi
    fi
done
