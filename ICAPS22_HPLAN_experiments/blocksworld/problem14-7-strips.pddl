( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b977 - block
    b549 - block
    b334 - block
    b782 - block
    b788 - block
    b882 - block
    b900 - block
    b791 - block
    b343 - block
    b611 - block
    b717 - block
    b151 - block
    b488 - block
    b399 - block
    b63 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b977 )
    ( on b549 b977 )
    ( on b334 b549 )
    ( on b782 b334 )
    ( on b788 b782 )
    ( on b882 b788 )
    ( on b900 b882 )
    ( on b791 b900 )
    ( on b343 b791 )
    ( on b611 b343 )
    ( on b717 b611 )
    ( on b151 b717 )
    ( on b488 b151 )
    ( on b399 b488 )
    ( on b63 b399 )
    ( clear b63 )
  )
  ( :goal
    ( and
      ( clear b977 )
    )
  )
)
