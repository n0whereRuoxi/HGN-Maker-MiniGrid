( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b397 - block
    b296 - block
    b84 - block
    b858 - block
    b261 - block
    b499 - block
    b556 - block
    b877 - block
    b278 - block
    b181 - block
    b994 - block
    b967 - block
    b727 - block
    b823 - block
    b453 - block
    b452 - block
    b19 - block
    b89 - block
    b760 - block
    b2 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b397 )
    ( on b296 b397 )
    ( on b84 b296 )
    ( on b858 b84 )
    ( on b261 b858 )
    ( on b499 b261 )
    ( on b556 b499 )
    ( on b877 b556 )
    ( on b278 b877 )
    ( on b181 b278 )
    ( on b994 b181 )
    ( on b967 b994 )
    ( on b727 b967 )
    ( on b823 b727 )
    ( on b453 b823 )
    ( on b452 b453 )
    ( on b19 b452 )
    ( on b89 b19 )
    ( on b760 b89 )
    ( on b2 b760 )
    ( clear b2 )
  )
  ( :goal
    ( and
      ( clear b397 )
    )
  )
)
