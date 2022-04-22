( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b699 - block
    b860 - block
    b931 - block
    b524 - block
    b901 - block
    b534 - block
    b942 - block
    b895 - block
    b919 - block
    b872 - block
    b576 - block
    b821 - block
    b344 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b699 )
    ( on b860 b699 )
    ( on b931 b860 )
    ( on b524 b931 )
    ( on b901 b524 )
    ( on b534 b901 )
    ( on b942 b534 )
    ( on b895 b942 )
    ( on b919 b895 )
    ( on b872 b919 )
    ( on b576 b872 )
    ( on b821 b576 )
    ( on b344 b821 )
    ( clear b344 )
  )
  ( :goal
    ( and
      ( clear b699 )
    )
  )
)
