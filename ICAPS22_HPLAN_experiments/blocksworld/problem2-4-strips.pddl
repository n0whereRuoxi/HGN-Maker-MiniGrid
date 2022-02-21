( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b512 - block
    b838 - block
    b228 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b512 )
    ( on b838 b512 )
    ( on b228 b838 )
    ( clear b228 )
  )
  ( :goal
    ( and
      ( clear b512 )
    )
  )
)
