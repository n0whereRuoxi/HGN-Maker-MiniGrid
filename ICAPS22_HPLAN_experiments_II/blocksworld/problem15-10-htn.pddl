( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b912 - block
    b73 - block
    b923 - block
    b419 - block
    b645 - block
    b463 - block
    b615 - block
    b871 - block
    b148 - block
    b179 - block
    b296 - block
    b979 - block
    b653 - block
    b234 - block
    b70 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b912 b126 )
    ( on b73 b912 )
    ( on b923 b73 )
    ( on b419 b923 )
    ( on b645 b419 )
    ( on b463 b645 )
    ( on b615 b463 )
    ( on b871 b615 )
    ( on b148 b871 )
    ( on b179 b148 )
    ( on b296 b179 )
    ( on b979 b296 )
    ( on b653 b979 )
    ( on b234 b653 )
    ( on b70 b234 )
    ( clear b70 )
  )
  ( :tasks
    ( Make-15Pile b912 b73 b923 b419 b645 b463 b615 b871 b148 b179 b296 b979 b653 b234 b70 )
  )
)
