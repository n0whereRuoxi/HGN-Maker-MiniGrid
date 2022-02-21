( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b796 - block
    b44 - block
    b37 - block
    b549 - block
    b563 - block
    b827 - block
    b79 - block
    b626 - block
    b200 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b796 )
    ( on b44 b796 )
    ( on b37 b44 )
    ( on b549 b37 )
    ( on b563 b549 )
    ( on b827 b563 )
    ( on b79 b827 )
    ( on b626 b79 )
    ( on b200 b626 )
    ( clear b200 )
  )
  ( :goal
    ( and
      ( clear b796 )
    )
  )
)
