( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b207 - block
    b132 - block
    b792 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b207 )
    ( on b132 b207 )
    ( on b792 b132 )
    ( clear b792 )
  )
  ( :goal
    ( and
      ( clear b207 )
      ( clear b207 )
      ( clear b207 )
    )
  )
)
