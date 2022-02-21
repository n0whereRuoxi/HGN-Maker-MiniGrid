( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b600 - block
    b178 - block
    b991 - block
    b957 - block
    b629 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b600 )
    ( on b178 b600 )
    ( on b991 b178 )
    ( on b957 b991 )
    ( on b629 b957 )
    ( clear b629 )
  )
  ( :goal
    ( and
      ( clear b600 )
    )
  )
)
