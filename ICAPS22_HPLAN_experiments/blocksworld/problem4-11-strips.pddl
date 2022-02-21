( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b590 - block
    b672 - block
    b529 - block
    b458 - block
    b4 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b590 )
    ( on b672 b590 )
    ( on b529 b672 )
    ( on b458 b529 )
    ( on b4 b458 )
    ( clear b4 )
  )
  ( :goal
    ( and
      ( clear b590 )
    )
  )
)
