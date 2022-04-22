( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b941 - block
    b125 - block
    b122 - block
    b521 - block
    b694 - block
    b313 - block
    b351 - block
    b219 - block
    b629 - block
    b812 - block
    b666 - block
    b151 - block
    b608 - block
    b84 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b941 )
    ( on b125 b941 )
    ( on b122 b125 )
    ( on b521 b122 )
    ( on b694 b521 )
    ( on b313 b694 )
    ( on b351 b313 )
    ( on b219 b351 )
    ( on b629 b219 )
    ( on b812 b629 )
    ( on b666 b812 )
    ( on b151 b666 )
    ( on b608 b151 )
    ( on b84 b608 )
    ( clear b84 )
  )
  ( :goal
    ( and
      ( clear b941 )
    )
  )
)
