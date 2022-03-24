( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b873 - block
    b604 - block
    b745 - block
    b58 - block
    b771 - block
    b614 - block
    b824 - block
    b68 - block
    b904 - block
    b299 - block
    b134 - block
    b34 - block
    b60 - block
    b525 - block
    b170 - block
    b620 - block
    b706 - block
    b871 - block
    b714 - block
    b291 - block
    b394 - block
    b504 - block
    b323 - block
    b2 - block
    b808 - block
    b954 - block
    b9 - block
    b825 - block
    b328 - block
    b926 - block
    b311 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b873 b337 )
    ( on b604 b873 )
    ( on b745 b604 )
    ( on b58 b745 )
    ( on b771 b58 )
    ( on b614 b771 )
    ( on b824 b614 )
    ( on b68 b824 )
    ( on b904 b68 )
    ( on b299 b904 )
    ( on b134 b299 )
    ( on b34 b134 )
    ( on b60 b34 )
    ( on b525 b60 )
    ( on b170 b525 )
    ( on b620 b170 )
    ( on b706 b620 )
    ( on b871 b706 )
    ( on b714 b871 )
    ( on b291 b714 )
    ( on b394 b291 )
    ( on b504 b394 )
    ( on b323 b504 )
    ( on b2 b323 )
    ( on b808 b2 )
    ( on b954 b808 )
    ( on b9 b954 )
    ( on b825 b9 )
    ( on b328 b825 )
    ( on b926 b328 )
    ( on b311 b926 )
    ( clear b311 )
  )
  ( :goal
    ( and
      ( clear b337 )
    )
  )
)
