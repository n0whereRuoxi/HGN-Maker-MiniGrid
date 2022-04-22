( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b264 - block
    b586 - block
    b976 - block
    b991 - block
    b959 - block
    b628 - block
    b845 - block
    b442 - block
    b728 - block
    b804 - block
    b819 - block
    b148 - block
    b672 - block
    b739 - block
    b87 - block
    b9 - block
    b488 - block
    b560 - block
    b535 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b264 )
    ( on b586 b264 )
    ( on b976 b586 )
    ( on b991 b976 )
    ( on b959 b991 )
    ( on b628 b959 )
    ( on b845 b628 )
    ( on b442 b845 )
    ( on b728 b442 )
    ( on b804 b728 )
    ( on b819 b804 )
    ( on b148 b819 )
    ( on b672 b148 )
    ( on b739 b672 )
    ( on b87 b739 )
    ( on b9 b87 )
    ( on b488 b9 )
    ( on b560 b488 )
    ( on b535 b560 )
    ( clear b535 )
  )
  ( :goal
    ( and
      ( clear b264 )
    )
  )
)
