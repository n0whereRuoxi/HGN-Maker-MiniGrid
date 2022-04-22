( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b975 - block
    b476 - block
    b427 - block
    b490 - block
    b809 - block
    b945 - block
    b865 - block
    b97 - block
    b484 - block
    b4 - block
    b627 - block
    b344 - block
    b979 - block
    b699 - block
    b745 - block
    b428 - block
    b22 - block
    b299 - block
    b199 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b476 b975 )
    ( on b427 b476 )
    ( on b490 b427 )
    ( on b809 b490 )
    ( on b945 b809 )
    ( on b865 b945 )
    ( on b97 b865 )
    ( on b484 b97 )
    ( on b4 b484 )
    ( on b627 b4 )
    ( on b344 b627 )
    ( on b979 b344 )
    ( on b699 b979 )
    ( on b745 b699 )
    ( on b428 b745 )
    ( on b22 b428 )
    ( on b299 b22 )
    ( on b199 b299 )
    ( clear b199 )
  )
  ( :goal
    ( and
      ( clear b975 )
    )
  )
)
