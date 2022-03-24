( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b534 - block
    b999 - block
    b402 - block
    b884 - block
    b783 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b534 )
    ( on b999 b534 )
    ( on b402 b999 )
    ( on b884 b402 )
    ( on b783 b884 )
    ( clear b783 )
  )
  ( :goal
    ( and
      ( clear b534 )
    )
  )
)
