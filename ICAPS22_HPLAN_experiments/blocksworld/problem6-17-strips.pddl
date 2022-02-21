( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b941 - block
    b175 - block
    b281 - block
    b633 - block
    b432 - block
    b474 - block
    b796 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b941 )
    ( on b175 b941 )
    ( on b281 b175 )
    ( on b633 b281 )
    ( on b432 b633 )
    ( on b474 b432 )
    ( on b796 b474 )
    ( clear b796 )
  )
  ( :goal
    ( and
      ( clear b941 )
    )
  )
)
