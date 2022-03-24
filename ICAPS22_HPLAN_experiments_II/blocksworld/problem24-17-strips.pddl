( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b637 - block
    b751 - block
    b987 - block
    b652 - block
    b669 - block
    b778 - block
    b940 - block
    b416 - block
    b123 - block
    b881 - block
    b958 - block
    b852 - block
    b836 - block
    b615 - block
    b906 - block
    b132 - block
    b559 - block
    b281 - block
    b62 - block
    b212 - block
    b613 - block
    b243 - block
    b56 - block
    b521 - block
    b974 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b637 )
    ( on b751 b637 )
    ( on b987 b751 )
    ( on b652 b987 )
    ( on b669 b652 )
    ( on b778 b669 )
    ( on b940 b778 )
    ( on b416 b940 )
    ( on b123 b416 )
    ( on b881 b123 )
    ( on b958 b881 )
    ( on b852 b958 )
    ( on b836 b852 )
    ( on b615 b836 )
    ( on b906 b615 )
    ( on b132 b906 )
    ( on b559 b132 )
    ( on b281 b559 )
    ( on b62 b281 )
    ( on b212 b62 )
    ( on b613 b212 )
    ( on b243 b613 )
    ( on b56 b243 )
    ( on b521 b56 )
    ( on b974 b521 )
    ( clear b974 )
  )
  ( :goal
    ( and
      ( clear b637 )
    )
  )
)
