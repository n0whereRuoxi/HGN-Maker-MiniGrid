( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b319 - block
    b598 - block
    b301 - block
    b537 - block
    b524 - block
    b439 - block
    b578 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b319 )
    ( on b598 b319 )
    ( on b301 b598 )
    ( on b537 b301 )
    ( on b524 b537 )
    ( on b439 b524 )
    ( on b578 b439 )
    ( clear b578 )
  )
  ( :goal
    ( and
      ( clear b319 )
    )
  )
)
