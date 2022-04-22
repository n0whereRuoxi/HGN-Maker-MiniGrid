( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b671 - block
    b569 - block
    b481 - block
    b111 - block
    b453 - block
    b426 - block
    b321 - block
    b722 - block
    b594 - block
    b707 - block
    b533 - block
    b274 - block
    b797 - block
    b432 - block
    b769 - block
    b156 - block
    b44 - block
    b550 - block
    b761 - block
    b93 - block
    b332 - block
    b292 - block
    b690 - block
    b874 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b671 )
    ( on b569 b671 )
    ( on b481 b569 )
    ( on b111 b481 )
    ( on b453 b111 )
    ( on b426 b453 )
    ( on b321 b426 )
    ( on b722 b321 )
    ( on b594 b722 )
    ( on b707 b594 )
    ( on b533 b707 )
    ( on b274 b533 )
    ( on b797 b274 )
    ( on b432 b797 )
    ( on b769 b432 )
    ( on b156 b769 )
    ( on b44 b156 )
    ( on b550 b44 )
    ( on b761 b550 )
    ( on b93 b761 )
    ( on b332 b93 )
    ( on b292 b332 )
    ( on b690 b292 )
    ( on b874 b690 )
    ( on b502 b874 )
    ( clear b502 )
  )
  ( :goal
    ( and
      ( clear b671 )
    )
  )
)
