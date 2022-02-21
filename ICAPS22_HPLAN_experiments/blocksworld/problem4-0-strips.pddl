( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b677 - block
    b716 - block
    b103 - block
    b6 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b677 )
    ( on b716 b677 )
    ( on b103 b716 )
    ( on b6 b103 )
    ( on b437 b6 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b677 )
    )
  )
)
