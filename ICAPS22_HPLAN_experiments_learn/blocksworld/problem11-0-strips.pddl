( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b423 - block
    b836 - block
    b142 - block
    b381 - block
    b229 - block
    b882 - block
    b327 - block
    b402 - block
    b855 - block
    b17 - block
    b433 - block
    b762 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b423 )
    ( on b836 b423 )
    ( on b142 b836 )
    ( on b381 b142 )
    ( on b229 b381 )
    ( on b882 b229 )
    ( on b327 b882 )
    ( on b402 b327 )
    ( on b855 b402 )
    ( on b17 b855 )
    ( on b433 b17 )
    ( on b762 b433 )
    ( clear b762 )
  )
  ( :goal
    ( and
      ( clear b423 )
    )
  )
)
