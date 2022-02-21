( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b332 - block
    b618 - block
    b15 - block
    b821 - block
    b516 - block
    b241 - block
    b619 - block
    b561 - block
    b801 - block
    b685 - block
    b118 - block
    b719 - block
    b512 - block
    b547 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b332 b771 )
    ( on b618 b332 )
    ( on b15 b618 )
    ( on b821 b15 )
    ( on b516 b821 )
    ( on b241 b516 )
    ( on b619 b241 )
    ( on b561 b619 )
    ( on b801 b561 )
    ( on b685 b801 )
    ( on b118 b685 )
    ( on b719 b118 )
    ( on b512 b719 )
    ( on b547 b512 )
    ( clear b547 )
  )
  ( :goal
    ( and
      ( clear b771 )
    )
  )
)
