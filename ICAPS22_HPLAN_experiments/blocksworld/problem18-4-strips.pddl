( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b364 - block
    b518 - block
    b991 - block
    b55 - block
    b243 - block
    b224 - block
    b330 - block
    b828 - block
    b34 - block
    b773 - block
    b583 - block
    b660 - block
    b214 - block
    b990 - block
    b723 - block
    b59 - block
    b170 - block
    b475 - block
    b318 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b364 )
    ( on b518 b364 )
    ( on b991 b518 )
    ( on b55 b991 )
    ( on b243 b55 )
    ( on b224 b243 )
    ( on b330 b224 )
    ( on b828 b330 )
    ( on b34 b828 )
    ( on b773 b34 )
    ( on b583 b773 )
    ( on b660 b583 )
    ( on b214 b660 )
    ( on b990 b214 )
    ( on b723 b990 )
    ( on b59 b723 )
    ( on b170 b59 )
    ( on b475 b170 )
    ( on b318 b475 )
    ( clear b318 )
  )
  ( :goal
    ( and
      ( clear b364 )
    )
  )
)
