( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b233 - block
    b843 - block
    b560 - block
    b884 - block
    b735 - block
    b303 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b233 b721 )
    ( on b843 b233 )
    ( on b560 b843 )
    ( on b884 b560 )
    ( on b735 b884 )
    ( on b303 b735 )
    ( clear b303 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
