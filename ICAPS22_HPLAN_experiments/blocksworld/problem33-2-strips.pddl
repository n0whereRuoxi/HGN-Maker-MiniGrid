( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b406 - block
    b933 - block
    b258 - block
    b148 - block
    b818 - block
    b408 - block
    b323 - block
    b271 - block
    b721 - block
    b424 - block
    b518 - block
    b329 - block
    b632 - block
    b409 - block
    b835 - block
    b571 - block
    b244 - block
    b8 - block
    b405 - block
    b898 - block
    b330 - block
    b489 - block
    b509 - block
    b644 - block
    b960 - block
    b461 - block
    b84 - block
    b732 - block
    b531 - block
    b293 - block
    b475 - block
    b633 - block
    b934 - block
    b217 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b406 )
    ( on b933 b406 )
    ( on b258 b933 )
    ( on b148 b258 )
    ( on b818 b148 )
    ( on b408 b818 )
    ( on b323 b408 )
    ( on b271 b323 )
    ( on b721 b271 )
    ( on b424 b721 )
    ( on b518 b424 )
    ( on b329 b518 )
    ( on b632 b329 )
    ( on b409 b632 )
    ( on b835 b409 )
    ( on b571 b835 )
    ( on b244 b571 )
    ( on b8 b244 )
    ( on b405 b8 )
    ( on b898 b405 )
    ( on b330 b898 )
    ( on b489 b330 )
    ( on b509 b489 )
    ( on b644 b509 )
    ( on b960 b644 )
    ( on b461 b960 )
    ( on b84 b461 )
    ( on b732 b84 )
    ( on b531 b732 )
    ( on b293 b531 )
    ( on b475 b293 )
    ( on b633 b475 )
    ( on b934 b633 )
    ( on b217 b934 )
    ( clear b217 )
  )
  ( :goal
    ( and
      ( clear b406 )
    )
  )
)
