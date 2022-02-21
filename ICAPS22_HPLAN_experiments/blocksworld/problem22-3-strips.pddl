( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b291 - block
    b610 - block
    b519 - block
    b674 - block
    b381 - block
    b47 - block
    b718 - block
    b217 - block
    b771 - block
    b259 - block
    b438 - block
    b164 - block
    b751 - block
    b999 - block
    b160 - block
    b411 - block
    b308 - block
    b23 - block
    b939 - block
    b926 - block
    b857 - block
    b942 - block
    b165 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b291 )
    ( on b610 b291 )
    ( on b519 b610 )
    ( on b674 b519 )
    ( on b381 b674 )
    ( on b47 b381 )
    ( on b718 b47 )
    ( on b217 b718 )
    ( on b771 b217 )
    ( on b259 b771 )
    ( on b438 b259 )
    ( on b164 b438 )
    ( on b751 b164 )
    ( on b999 b751 )
    ( on b160 b999 )
    ( on b411 b160 )
    ( on b308 b411 )
    ( on b23 b308 )
    ( on b939 b23 )
    ( on b926 b939 )
    ( on b857 b926 )
    ( on b942 b857 )
    ( on b165 b942 )
    ( clear b165 )
  )
  ( :goal
    ( and
      ( clear b291 )
    )
  )
)
