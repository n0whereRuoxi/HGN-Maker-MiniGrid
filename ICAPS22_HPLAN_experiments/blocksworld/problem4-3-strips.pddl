( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b469 - block
    b296 - block
    b438 - block
    b688 - block
    b715 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b469 )
    ( on b296 b469 )
    ( on b438 b296 )
    ( on b688 b438 )
    ( on b715 b688 )
    ( clear b715 )
  )
  ( :goal
    ( and
      ( clear b469 )
    )
  )
)
