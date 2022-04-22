( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b653 - block
    b84 - block
    b67 - block
    b275 - block
    b550 - block
    b941 - block
    b254 - block
    b613 - block
    b428 - block
    b338 - block
    b116 - block
    b710 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b653 )
    ( on b84 b653 )
    ( on b67 b84 )
    ( on b275 b67 )
    ( on b550 b275 )
    ( on b941 b550 )
    ( on b254 b941 )
    ( on b613 b254 )
    ( on b428 b613 )
    ( on b338 b428 )
    ( on b116 b338 )
    ( on b710 b116 )
    ( clear b710 )
  )
  ( :goal
    ( and
      ( clear b653 )
    )
  )
)
