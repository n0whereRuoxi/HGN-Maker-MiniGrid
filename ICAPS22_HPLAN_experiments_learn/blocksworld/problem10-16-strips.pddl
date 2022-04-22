( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b394 - block
    b672 - block
    b194 - block
    b987 - block
    b912 - block
    b231 - block
    b774 - block
    b63 - block
    b96 - block
    b639 - block
    b762 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b394 )
    ( on b672 b394 )
    ( on b194 b672 )
    ( on b987 b194 )
    ( on b912 b987 )
    ( on b231 b912 )
    ( on b774 b231 )
    ( on b63 b774 )
    ( on b96 b63 )
    ( on b639 b96 )
    ( on b762 b639 )
    ( clear b762 )
  )
  ( :goal
    ( and
      ( clear b394 )
    )
  )
)
