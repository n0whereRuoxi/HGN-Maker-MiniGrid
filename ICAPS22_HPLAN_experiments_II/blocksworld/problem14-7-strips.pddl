( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b850 - block
    b217 - block
    b618 - block
    b225 - block
    b708 - block
    b119 - block
    b630 - block
    b556 - block
    b63 - block
    b590 - block
    b135 - block
    b10 - block
    b767 - block
    b122 - block
    b215 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b850 )
    ( on b217 b850 )
    ( on b618 b217 )
    ( on b225 b618 )
    ( on b708 b225 )
    ( on b119 b708 )
    ( on b630 b119 )
    ( on b556 b630 )
    ( on b63 b556 )
    ( on b590 b63 )
    ( on b135 b590 )
    ( on b10 b135 )
    ( on b767 b10 )
    ( on b122 b767 )
    ( on b215 b122 )
    ( clear b215 )
  )
  ( :goal
    ( and
      ( clear b850 )
    )
  )
)
