( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b793 - block
    b425 - block
    b706 - block
    b582 - block
    b691 - block
    b297 - block
    b941 - block
    b24 - block
    b587 - block
    b543 - block
    b569 - block
    b609 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b793 )
    ( on b425 b793 )
    ( on b706 b425 )
    ( on b582 b706 )
    ( on b691 b582 )
    ( on b297 b691 )
    ( on b941 b297 )
    ( on b24 b941 )
    ( on b587 b24 )
    ( on b543 b587 )
    ( on b569 b543 )
    ( on b609 b569 )
    ( clear b609 )
  )
  ( :goal
    ( and
      ( clear b793 )
    )
  )
)
