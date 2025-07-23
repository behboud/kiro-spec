#!/bin/bash

echo "Comprehensive link fixing for spec-process-guide..."

# For files in subdirectories that incorrectly link to README.md when they should link to ../*/README.md
find spec-process-guide -mindepth 2 -name "*.md" -type f | while read file; do
    echo "Processing: $file"
    
    # Fix wrong README.md references that should point to other directories
    sed -i 's|\[Process Guide\](README\.md|\[Process Guide\](../process/README.md|g' "$file"
    sed -i 's|\[Methodology Overview\](README\.md|\[Methodology Overview\](../methodology/README.md|g' "$file"
    sed -i 's|\[Methodology\](README\.md|\[Methodology\](../methodology/README.md|g' "$file"
    sed -i 's|\[Examples\](README\.md|\[Examples\](../examples/README.md|g' "$file"
    sed -i 's|\[Templates\](README\.md|\[Templates\](../templates/README.md|g' "$file"
    sed -i 's|\[Prompting Strategies\](README\.md|\[Prompting Strategies\](../prompting/README.md|g' "$file"
    sed -i 's|\[AI Reasoning\](README\.md|\[AI Reasoning\](../ai-reasoning/README.md|g' "$file"
    sed -i 's|\[Execution Guide\](README\.md|\[Execution Guide\](../execution/README.md|g' "$file"
    sed -i 's|\[Resources\](README\.md|\[Resources\](../resources/README.md|g' "$file"
    sed -i 's|\[Back to Main Guide\](README\.md|\[Back to Main Guide\](../../README.md|g' "$file"
    sed -i 's|\[Main Guide\](README\.md|\[Main Guide\](../../README.md|g' "$file"
    sed -i 's|\[Execution Troubleshooting\](README\.md|\[Execution Troubleshooting\](../execution/README.md|g' "$file"
    
    # Special case patterns that need fixing
    sed -i 's|\](README\.md) - Three-phase workflow|\](../process/README.md) - Three-phase workflow|g' "$file"
    sed -i 's|\](README\.md) - Understand the foundation|\](../methodology/README.md) - Understand the foundation|g' "$file"
    sed -i 's|\](README\.md) - Ready-to-use starting points|\](../templates/README.md) - Ready-to-use starting points|g' "$file"
    sed -i 's|\](README\.md) - Learn from real examples|\](../examples/README.md) - Learn from real examples|g' "$file"
    
done

echo "Comprehensive link fixes applied!"
