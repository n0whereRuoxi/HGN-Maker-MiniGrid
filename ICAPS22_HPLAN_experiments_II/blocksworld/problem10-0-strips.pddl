( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b556 - block
    b743 - block
    b929 - block
    b190 - block
    b590 - block
    b699 - block
    b112 - block
    b864 - block
    b422 - block
    b672 - block
    b103 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b556 )
    ( on b743 b556 )
    ( on b929 b743 )
    ( on b190 b929 )
    ( on b590 b190 )
    ( on b699 b590 )
    ( on b112 b699 )
    ( on b864 b112 )
    ( on b422 b864 )
    ( on b672 b422 )
    ( on b103 b672 )
    ( clear b103 )
  )
  ( :goal
    ( and
      ( clear b556 )
    )
  )
)
