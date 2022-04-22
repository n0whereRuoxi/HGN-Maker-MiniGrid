( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b727 - block
    b362 - block
    b802 - block
    b89 - block
    b228 - block
    b785 - block
    b73 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b727 )
    ( on b362 b727 )
    ( on b802 b362 )
    ( on b89 b802 )
    ( on b228 b89 )
    ( on b785 b228 )
    ( on b73 b785 )
    ( clear b73 )
  )
  ( :goal
    ( and
      ( clear b727 )
    )
  )
)
