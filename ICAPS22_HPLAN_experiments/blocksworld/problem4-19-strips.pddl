( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b201 - block
    b468 - block
    b423 - block
    b789 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b201 b83 )
    ( on b468 b201 )
    ( on b423 b468 )
    ( on b789 b423 )
    ( clear b789 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
