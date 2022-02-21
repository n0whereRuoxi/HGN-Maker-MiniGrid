( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b358 - block
    b521 - block
    b919 - block
    b667 - block
    b499 - block
    b45 - block
    b834 - block
    b964 - block
    b868 - block
    b621 - block
    b492 - block
    b270 - block
    b421 - block
    b625 - block
    b532 - block
    b36 - block
    b736 - block
    b710 - block
    b786 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b358 )
    ( on b521 b358 )
    ( on b919 b521 )
    ( on b667 b919 )
    ( on b499 b667 )
    ( on b45 b499 )
    ( on b834 b45 )
    ( on b964 b834 )
    ( on b868 b964 )
    ( on b621 b868 )
    ( on b492 b621 )
    ( on b270 b492 )
    ( on b421 b270 )
    ( on b625 b421 )
    ( on b532 b625 )
    ( on b36 b532 )
    ( on b736 b36 )
    ( on b710 b736 )
    ( on b786 b710 )
    ( on b126 b786 )
    ( clear b126 )
  )
  ( :goal
    ( and
      ( clear b358 )
    )
  )
)
