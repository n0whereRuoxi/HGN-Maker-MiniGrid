( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b781 - block
    b807 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b781 b871 )
    ( on b807 b781 )
    ( on b201 b807 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
