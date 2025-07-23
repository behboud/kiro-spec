#!/bin/bash

echo "Final codebase.md link fixes..."

# Fix remaining standalone file references in codebase.md
sed -i 's|\](simple-feature-spec\.md|\](spec-process-guide/examples/simple-feature-spec.md|g' codebase.md
sed -i 's|\](complex-system-spec\.md|\](spec-process-guide/examples/complex-system-spec.md|g' codebase.md
sed -i 's|\](case-studies\.md|\](spec-process-guide/examples/case-studies.md|g' codebase.md
sed -i 's|\](troubleshooting-pitfalls\.md|\](spec-process-guide/examples/troubleshooting-pitfalls.md|g' codebase.md
sed -i 's|\](requirements-template\.md|\](spec-process-guide/templates/requirements-template.md|g' codebase.md
sed -i 's|\](design-template\.md|\](spec-process-guide/templates/design-template.md|g' codebase.md
sed -i 's|\](tasks-template\.md|\](spec-process-guide/templates/tasks-template.md|g' codebase.md
sed -i 's|\](micro-spec-template\.md|\](spec-process-guide/templates/micro-spec-template.md|g' codebase.md
sed -i 's|\](quick-spec-template\.md|\](spec-process-guide/templates/quick-spec-template.md|g' codebase.md
sed -i 's|\](checklists\.md|\](spec-process-guide/templates/checklists.md|g' codebase.md
sed -i 's|\](implementation-guide\.md|\](spec-process-guide/execution/implementation-guide.md|g' codebase.md
sed -i 's|\](quality-assurance\.md|\](spec-process-guide/execution/quality-assurance.md|g' codebase.md
sed -i 's|\](best-practices\.md|\](spec-process-guide/prompting/best-practices.md|g' codebase.md
sed -i 's|\](templates\.md|\](spec-process-guide/prompting/templates.md|g' codebase.md
sed -i 's|\](standards\.md|\](spec-process-guide/resources/standards.md|g' codebase.md
sed -i 's|\](tools\.md|\](spec-process-guide/resources/tools.md|g' codebase.md
sed -i 's|\](tool-integration-guide\.md|\](spec-process-guide/resources/tool-integration-guide.md|g' codebase.md
sed -i 's|\](when-to-use\.md|\](spec-process-guide/methodology/when-to-use.md|g' codebase.md
sed -i 's|\](lightweight-specs\.md|\](spec-process-guide/methodology/lightweight-specs.md|g' codebase.md
sed -i 's|\](requirements-phase\.md|\](spec-process-guide/process/requirements-phase.md|g' codebase.md
sed -i 's|\](design-phase\.md|\](spec-process-guide/process/design-phase.md|g' codebase.md
sed -i 's|\](tasks-phase\.md|\](spec-process-guide/process/tasks-phase.md|g' codebase.md
sed -i 's|\](change-management\.md|\](spec-process-guide/process/change-management.md|g' codebase.md
sed -i 's|\](workflow-diagrams\.md|\](spec-process-guide/process/workflow-diagrams.md|g' codebase.md

echo "Final codebase.md fixes applied!"
