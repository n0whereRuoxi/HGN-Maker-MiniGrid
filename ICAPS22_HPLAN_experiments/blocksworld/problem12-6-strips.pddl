( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b89 - block
    b285 - block
    b441 - block
    b147 - block
    b764 - block
    b952 - block
    b455 - block
    b679 - block
    b669 - block
    b113 - block
    b918 - block
    b216 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b89 b728 )
    ( on b285 b89 )
    ( on b441 b285 )
    ( on b147 b441 )
    ( on b764 b147 )
    ( on b952 b764 )
    ( on b455 b952 )
    ( on b679 b455 )
    ( on b669 b679 )
    ( on b113 b669 )
    ( on b918 b113 )
    ( on b216 b918 )
    ( clear b216 )
  )
  ( :goal
    ( and
      ( clear b728 )
    )
  )
)
