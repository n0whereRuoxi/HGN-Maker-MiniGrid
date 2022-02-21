( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b532 - block
    b200 - block
    b909 - block
    b396 - block
    b588 - block
    b635 - block
    b729 - block
    b491 - block
    b603 - block
    b291 - block
    b937 - block
    b87 - block
    b95 - block
    b979 - block
    b266 - block
    b538 - block
    b3 - block
    b141 - block
    b247 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b532 )
    ( on b200 b532 )
    ( on b909 b200 )
    ( on b396 b909 )
    ( on b588 b396 )
    ( on b635 b588 )
    ( on b729 b635 )
    ( on b491 b729 )
    ( on b603 b491 )
    ( on b291 b603 )
    ( on b937 b291 )
    ( on b87 b937 )
    ( on b95 b87 )
    ( on b979 b95 )
    ( on b266 b979 )
    ( on b538 b266 )
    ( on b3 b538 )
    ( on b141 b3 )
    ( on b247 b141 )
    ( clear b247 )
  )
  ( :goal
    ( and
      ( clear b532 )
    )
  )
)
