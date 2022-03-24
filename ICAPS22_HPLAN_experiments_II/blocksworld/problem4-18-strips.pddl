( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b538 - block
    b162 - block
    b198 - block
    b77 - block
    b328 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b162 b538 )
    ( on b198 b162 )
    ( on b77 b198 )
    ( on b328 b77 )
    ( clear b328 )
  )
  ( :goal
    ( and
      ( clear b538 )
    )
  )
)
