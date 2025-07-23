#!/bin/bash

# Fix links in codebase.md - replace all instances of standalone paths with spec-process-guide/ prefix
sed -i 's|\](methodology/|\](spec-process-guide/methodology/|g' codebase.md
sed -i 's|\](process/|\](spec-process-guide/process/|g' codebase.md
sed -i 's|\](examples/|\](spec-process-guide/examples/|g' codebase.md
sed -i 's|\](templates/|\](spec-process-guide/templates/|g' codebase.md
sed -i 's|\](prompting/|\](spec-process-guide/prompting/|g' codebase.md
sed -i 's|\](ai-reasoning/|\](spec-process-guide/ai-reasoning/|g' codebase.md
sed -i 's|\](execution/|\](spec-process-guide/execution/|g' codebase.md
sed -i 's|\](resources/|\](spec-process-guide/resources/|g' codebase.md
sed -i 's|\](NAVIGATION\.md|\](spec-process-guide/NAVIGATION.md|g' codebase.md

# Fix .kiro references 
sed -i 's|\](capabilities\.md|\](.kiro/system/capabilities.md|g' codebase.md
sed -i 's|\](guidelines\.md|\](.kiro/system/guidelines.md|g' codebase.md
sed -i 's|\](response-style\.md|\](.kiro/system/response-style.md|g' codebase.md
sed -i 's|\](quality-standards\.md|\](.kiro/system/quality-standards.md|g' codebase.md
sed -i 's|\](workflow-patterns\.md|\](.kiro/system/workflow-patterns.md|g' codebase.md

echo "Fixed codebase.md links"

