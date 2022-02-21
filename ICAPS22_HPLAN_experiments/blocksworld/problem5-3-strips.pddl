( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b424 - block
    b447 - block
    b212 - block
    b207 - block
    b788 - block
    b420 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b424 )
    ( on b447 b424 )
    ( on b212 b447 )
    ( on b207 b212 )
    ( on b788 b207 )
    ( on b420 b788 )
    ( clear b420 )
  )
  ( :goal
    ( and
      ( clear b424 )
    )
  )
)
