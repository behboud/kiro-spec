#!/bin/bash

echo "Fixing remaining codebase.md relative links..."

# Fix relative links in codebase.md that are going up and should be absolute
sed -i 's|\](../methodology/README\.md|\](spec-process-guide/methodology/README.md|g' codebase.md
sed -i 's|\](../process/|\](spec-process-guide/process/|g' codebase.md
sed -i 's|\](../examples/|\](spec-process-guide/examples/|g' codebase.md
sed -i 's|\](../templates/|\](spec-process-guide/templates/|g' codebase.md
sed -i 's|\](../prompting/|\](spec-process-guide/prompting/|g' codebase.md
sed -i 's|\](../ai-reasoning/|\](spec-process-guide/ai-reasoning/|g' codebase.md
sed -i 's|\](../execution/|\](spec-process-guide/execution/|g' codebase.md
sed -i 's|\](../resources/|\](spec-process-guide/resources/|g' codebase.md
sed -i 's|\](../README\.md|\](README.md|g' codebase.md

# Fix standalone file references that should have full paths
sed -i 's|\](decision-frameworks\.md|\](spec-process-guide/ai-reasoning/decision-frameworks.md|g' codebase.md
sed -i 's|\](examples\.md|\](spec-process-guide/ai-reasoning/examples.md|g' codebase.md
sed -i 's|\](thought-processes\.md|\](spec-process-guide/ai-reasoning/thought-processes.md|g' codebase.md

echo "Fixed codebase.md relative links!"
