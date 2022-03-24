( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b241 - block
    b402 - block
    b843 - block
    b850 - block
    b779 - block
    b165 - block
    b945 - block
    b121 - block
    b870 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b241 )
    ( on b402 b241 )
    ( on b843 b402 )
    ( on b850 b843 )
    ( on b779 b850 )
    ( on b165 b779 )
    ( on b945 b165 )
    ( on b121 b945 )
    ( on b870 b121 )
    ( clear b870 )
  )
  ( :goal
    ( and
      ( clear b241 )
    )
  )
)
