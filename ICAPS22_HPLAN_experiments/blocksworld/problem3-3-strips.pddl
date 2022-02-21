( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b839 - block
    b697 - block
    b984 - block
    b593 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b839 )
    ( on b697 b839 )
    ( on b984 b697 )
    ( on b593 b984 )
    ( clear b593 )
  )
  ( :goal
    ( and
      ( clear b839 )
    )
  )
)
