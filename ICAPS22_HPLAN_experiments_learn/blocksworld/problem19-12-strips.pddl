( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b394 - block
    b521 - block
    b695 - block
    b250 - block
    b10 - block
    b953 - block
    b734 - block
    b774 - block
    b550 - block
    b260 - block
    b263 - block
    b622 - block
    b189 - block
    b896 - block
    b609 - block
    b111 - block
    b514 - block
    b823 - block
    b672 - block
    b3 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b394 )
    ( on b521 b394 )
    ( on b695 b521 )
    ( on b250 b695 )
    ( on b10 b250 )
    ( on b953 b10 )
    ( on b734 b953 )
    ( on b774 b734 )
    ( on b550 b774 )
    ( on b260 b550 )
    ( on b263 b260 )
    ( on b622 b263 )
    ( on b189 b622 )
    ( on b896 b189 )
    ( on b609 b896 )
    ( on b111 b609 )
    ( on b514 b111 )
    ( on b823 b514 )
    ( on b672 b823 )
    ( on b3 b672 )
    ( clear b3 )
  )
  ( :goal
    ( and
      ( clear b394 )
    )
  )
)
