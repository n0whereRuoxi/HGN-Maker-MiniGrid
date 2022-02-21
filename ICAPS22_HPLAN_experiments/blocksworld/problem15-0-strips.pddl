( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b46 - block
    b914 - block
    b179 - block
    b596 - block
    b552 - block
    b41 - block
    b173 - block
    b743 - block
    b227 - block
    b566 - block
    b745 - block
    b461 - block
    b471 - block
    b748 - block
    b217 - block
    b881 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b46 )
    ( on b914 b46 )
    ( on b179 b914 )
    ( on b596 b179 )
    ( on b552 b596 )
    ( on b41 b552 )
    ( on b173 b41 )
    ( on b743 b173 )
    ( on b227 b743 )
    ( on b566 b227 )
    ( on b745 b566 )
    ( on b461 b745 )
    ( on b471 b461 )
    ( on b748 b471 )
    ( on b217 b748 )
    ( on b881 b217 )
    ( clear b881 )
  )
  ( :goal
    ( and
      ( clear b46 )
    )
  )
)
