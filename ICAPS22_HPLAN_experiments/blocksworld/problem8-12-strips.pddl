( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b351 - block
    b298 - block
    b308 - block
    b731 - block
    b859 - block
    b605 - block
    b482 - block
    b473 - block
    b491 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b351 )
    ( on b298 b351 )
    ( on b308 b298 )
    ( on b731 b308 )
    ( on b859 b731 )
    ( on b605 b859 )
    ( on b482 b605 )
    ( on b473 b482 )
    ( on b491 b473 )
    ( clear b491 )
  )
  ( :goal
    ( and
      ( clear b351 )
    )
  )
)
