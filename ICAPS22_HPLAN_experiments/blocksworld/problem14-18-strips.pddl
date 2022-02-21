( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b491 - block
    b784 - block
    b246 - block
    b273 - block
    b291 - block
    b621 - block
    b125 - block
    b187 - block
    b209 - block
    b900 - block
    b6 - block
    b985 - block
    b412 - block
    b726 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b491 )
    ( on b784 b491 )
    ( on b246 b784 )
    ( on b273 b246 )
    ( on b291 b273 )
    ( on b621 b291 )
    ( on b125 b621 )
    ( on b187 b125 )
    ( on b209 b187 )
    ( on b900 b209 )
    ( on b6 b900 )
    ( on b985 b6 )
    ( on b412 b985 )
    ( on b726 b412 )
    ( on b370 b726 )
    ( clear b370 )
  )
  ( :goal
    ( and
      ( clear b491 )
    )
  )
)
