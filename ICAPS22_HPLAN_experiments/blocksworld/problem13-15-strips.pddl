( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b61 - block
    b960 - block
    b626 - block
    b218 - block
    b639 - block
    b610 - block
    b269 - block
    b42 - block
    b140 - block
    b138 - block
    b961 - block
    b945 - block
    b2 - block
    b134 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b61 )
    ( on b960 b61 )
    ( on b626 b960 )
    ( on b218 b626 )
    ( on b639 b218 )
    ( on b610 b639 )
    ( on b269 b610 )
    ( on b42 b269 )
    ( on b140 b42 )
    ( on b138 b140 )
    ( on b961 b138 )
    ( on b945 b961 )
    ( on b2 b945 )
    ( on b134 b2 )
    ( clear b134 )
  )
  ( :goal
    ( and
      ( clear b61 )
    )
  )
)
