( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b984 - block
    b211 - block
    b15 - block
    b174 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b984 )
    ( on b211 b984 )
    ( on b15 b211 )
    ( on b174 b15 )
    ( clear b174 )
  )
  ( :goal
    ( and
      ( clear b984 )
    )
  )
)
