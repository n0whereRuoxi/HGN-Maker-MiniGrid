( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b839 - block
    b979 - block
    b198 - block
    b869 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b839 b881 )
    ( on b979 b839 )
    ( on b198 b979 )
    ( on b869 b198 )
    ( clear b869 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
