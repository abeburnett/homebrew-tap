# SkillCanary Homebrew tap

SkillCanary checks AI skills and plugins before your agent reads them, and
installs them only after you approve. See https://skillcanary.com.

Install:

    brew tap abeburnett/tap
    brew trust abeburnett/tap
    brew install skillcanary

Then run `canary setup` and choose a protection level.

The formula installs the `canary` command from a tagged release of
https://github.com/abeburnett/canary, pinned by SHA-256.
