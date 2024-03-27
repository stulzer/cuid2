## [Unreleased]

## [0.1.0] - 2023-02-18

- Initial release

## [1.0.1] - 2024-03-26

#### *Add random first character to CUID*

This commit introduces a change to the CUID generation process. Now, each
CUID starts with a random letter from 'a' to 'z'. This change is intended
to increase the uniqueness of each CUID and reduce the likelihood of
collisions.

The tests have been updated to reflect this change. A new test has been
added to ensure that the first character of the CUID is not always the
same.
