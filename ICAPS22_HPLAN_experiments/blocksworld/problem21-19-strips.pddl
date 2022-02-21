( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b600 - block
    b565 - block
    b814 - block
    b435 - block
    b480 - block
    b18 - block
    b48 - block
    b11 - block
    b882 - block
    b850 - block
    b594 - block
    b438 - block
    b280 - block
    b357 - block
    b847 - block
    b87 - block
    b123 - block
    b843 - block
    b286 - block
    b278 - block
    b804 - block
    b276 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b600 )
    ( on b565 b600 )
    ( on b814 b565 )
    ( on b435 b814 )
    ( on b480 b435 )
    ( on b18 b480 )
    ( on b48 b18 )
    ( on b11 b48 )
    ( on b882 b11 )
    ( on b850 b882 )
    ( on b594 b850 )
    ( on b438 b594 )
    ( on b280 b438 )
    ( on b357 b280 )
    ( on b847 b357 )
    ( on b87 b847 )
    ( on b123 b87 )
    ( on b843 b123 )
    ( on b286 b843 )
    ( on b278 b286 )
    ( on b804 b278 )
    ( on b276 b804 )
    ( clear b276 )
  )
  ( :goal
    ( and
      ( clear b600 )
    )
  )
)
