# Refactoring Button Widgets to Reduce Redundancy and File Count

Consolidate highly similar button widgets in `lib/shared/widgets/buttons` to improve reusability, reduce boilerplate, and decrease the number of separate files.

## User Review Required

> [!IMPORTANT]
> We will consolidate `BackButton`, `NextButton`, `SaveButton`, and `CancelButton` (which are all thin wrappers around `PrimaryGradientButton` and optional `WelcomeConfig` animations) into a single reusable component file: `startup_action_button.dart`. We can export `BackButton`, `NextButton`, `SaveButton`, and `CancelButton` as classes/factories from this single file or update usages cleanly.

## Open Questions

- None. The design is straightforward and maintains full backward compatibility for existing button usages.

## Proposed Changes

### Shared Buttons Component Package (`lib/shared/widgets/buttons/`)

#### [NEW] [startup_action_button.dart](file:///C:/Personal/Code/projects/lib/shared/widgets/buttons/startup_action_button.dart)
- Combine `BackButton`, `NextButton`, `SaveButton`, and `CancelButton` into a single parameterized widget (`StartupActionButton`) with convenient static/named constructors or wrapper classes (`BackButton`, `NextButton`, `SaveButton`, `CancelButton`) defined in one file.

#### [DELETE] [back_button.dart](file:///C:/Personal/Code/projects/lib/shared/widgets/buttons/back_button.dart)
#### [DELETE] [next_button.dart](file:///C:/Personal/Code/projects/lib/shared/widgets/buttons/next_button.dart)
#### [DELETE] [save_button.dart](file:///C:/Personal/Code/projects/lib/shared/widgets/buttons/save_button.dart)
#### [DELETE] [cancel_button.dart](file:///C:/Personal/Code/projects/lib/shared/widgets/buttons/cancel_button.dart)

## Verification Plan

### Automated Tests
- Run `flutter analyze` and project build checks to ensure no compile errors or broken imports.

### Manual Verification
- Verify screens using startup/action buttons (Welcome screen, Create Profile screen, API Key screen, Processing Cards screen) render and function correctly.
