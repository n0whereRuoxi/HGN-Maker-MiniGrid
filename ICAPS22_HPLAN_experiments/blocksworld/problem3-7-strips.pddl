( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b447 - block
    b230 - block
    b833 - block
    b530 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b447 )
    ( on b230 b447 )
    ( on b833 b230 )
    ( on b530 b833 )
    ( clear b530 )
  )
  ( :goal
    ( and
      ( clear b447 )
    )
  )
)
