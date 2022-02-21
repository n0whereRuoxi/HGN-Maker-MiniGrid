( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b659 - block
    b184 - block
    b110 - block
    b716 - block
    b945 - block
    b17 - block
    b308 - block
    b735 - block
    b245 - block
    b691 - block
    b586 - block
    b564 - block
    b456 - block
    b621 - block
    b964 - block
    b450 - block
    b320 - block
    b53 - block
    b402 - block
    b682 - block
    b572 - block
    b999 - block
    b105 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b659 )
    ( on b184 b659 )
    ( on b110 b184 )
    ( on b716 b110 )
    ( on b945 b716 )
    ( on b17 b945 )
    ( on b308 b17 )
    ( on b735 b308 )
    ( on b245 b735 )
    ( on b691 b245 )
    ( on b586 b691 )
    ( on b564 b586 )
    ( on b456 b564 )
    ( on b621 b456 )
    ( on b964 b621 )
    ( on b450 b964 )
    ( on b320 b450 )
    ( on b53 b320 )
    ( on b402 b53 )
    ( on b682 b402 )
    ( on b572 b682 )
    ( on b999 b572 )
    ( on b105 b999 )
    ( clear b105 )
  )
  ( :goal
    ( and
      ( clear b659 )
    )
  )
)
