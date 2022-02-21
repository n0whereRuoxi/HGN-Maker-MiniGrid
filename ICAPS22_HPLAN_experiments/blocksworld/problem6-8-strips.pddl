( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b201 - block
    b121 - block
    b973 - block
    b78 - block
    b766 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b201 b242 )
    ( on b121 b201 )
    ( on b973 b121 )
    ( on b78 b973 )
    ( on b766 b78 )
    ( on b587 b766 )
    ( clear b587 )
  )
  ( :goal
    ( and
      ( clear b242 )
    )
  )
)
