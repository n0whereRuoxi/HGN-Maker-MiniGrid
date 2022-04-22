( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b217 - block
    b221 - block
    b520 - block
    b311 - block
    b230 - block
    b377 - block
    b452 - block
    b500 - block
    b198 - block
    b147 - block
    b234 - block
    b76 - block
    b444 - block
    b600 - block
    b424 - block
    b807 - block
    b896 - block
    b436 - block
    b237 - block
    b314 - block
    b531 - block
    b607 - block
    b65 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b217 b735 )
    ( on b221 b217 )
    ( on b520 b221 )
    ( on b311 b520 )
    ( on b230 b311 )
    ( on b377 b230 )
    ( on b452 b377 )
    ( on b500 b452 )
    ( on b198 b500 )
    ( on b147 b198 )
    ( on b234 b147 )
    ( on b76 b234 )
    ( on b444 b76 )
    ( on b600 b444 )
    ( on b424 b600 )
    ( on b807 b424 )
    ( on b896 b807 )
    ( on b436 b896 )
    ( on b237 b436 )
    ( on b314 b237 )
    ( on b531 b314 )
    ( on b607 b531 )
    ( on b65 b607 )
    ( clear b65 )
  )
  ( :goal
    ( and
      ( clear b735 )
    )
  )
)
