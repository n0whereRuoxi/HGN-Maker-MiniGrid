( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b387 - block
    b96 - block
    b86 - block
    b155 - block
    b98 - block
    b318 - block
    b839 - block
    b778 - block
    b730 - block
    b802 - block
    b50 - block
    b224 - block
    b1 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b387 )
    ( on b96 b387 )
    ( on b86 b96 )
    ( on b155 b86 )
    ( on b98 b155 )
    ( on b318 b98 )
    ( on b839 b318 )
    ( on b778 b839 )
    ( on b730 b778 )
    ( on b802 b730 )
    ( on b50 b802 )
    ( on b224 b50 )
    ( on b1 b224 )
    ( clear b1 )
  )
  ( :goal
    ( and
      ( clear b387 )
    )
  )
)
