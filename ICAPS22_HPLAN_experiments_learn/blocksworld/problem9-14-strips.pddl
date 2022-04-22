( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b97 - block
    b843 - block
    b713 - block
    b82 - block
    b570 - block
    b835 - block
    b926 - block
    b516 - block
    b315 - block
    b285 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b97 )
    ( on b843 b97 )
    ( on b713 b843 )
    ( on b82 b713 )
    ( on b570 b82 )
    ( on b835 b570 )
    ( on b926 b835 )
    ( on b516 b926 )
    ( on b315 b516 )
    ( on b285 b315 )
    ( clear b285 )
  )
  ( :goal
    ( and
      ( clear b97 )
    )
  )
)
