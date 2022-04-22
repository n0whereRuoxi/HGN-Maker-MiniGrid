( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b350 - block
    b19 - block
    b439 - block
    b915 - block
    b480 - block
    b725 - block
    b597 - block
    b550 - block
    b677 - block
    b696 - block
    b918 - block
    b165 - block
    b650 - block
    b575 - block
    b403 - block
    b566 - block
    b673 - block
    b215 - block
    b260 - block
    b397 - block
    b984 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b350 )
    ( on b19 b350 )
    ( on b439 b19 )
    ( on b915 b439 )
    ( on b480 b915 )
    ( on b725 b480 )
    ( on b597 b725 )
    ( on b550 b597 )
    ( on b677 b550 )
    ( on b696 b677 )
    ( on b918 b696 )
    ( on b165 b918 )
    ( on b650 b165 )
    ( on b575 b650 )
    ( on b403 b575 )
    ( on b566 b403 )
    ( on b673 b566 )
    ( on b215 b673 )
    ( on b260 b215 )
    ( on b397 b260 )
    ( on b984 b397 )
    ( clear b984 )
  )
  ( :goal
    ( and
      ( clear b350 )
    )
  )
)
