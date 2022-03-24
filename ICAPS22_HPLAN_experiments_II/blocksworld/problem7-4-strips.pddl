( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b3 - block
    b861 - block
    b58 - block
    b975 - block
    b538 - block
    b703 - block
    b344 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b3 )
    ( on b861 b3 )
    ( on b58 b861 )
    ( on b975 b58 )
    ( on b538 b975 )
    ( on b703 b538 )
    ( on b344 b703 )
    ( on b22 b344 )
    ( clear b22 )
  )
  ( :goal
    ( and
      ( clear b3 )
    )
  )
)
