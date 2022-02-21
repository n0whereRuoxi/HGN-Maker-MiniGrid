( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b912 - block
    b278 - block
    b543 - block
    b191 - block
    b871 - block
    b658 - block
    b375 - block
    b112 - block
    b496 - block
    b22 - block
    b401 - block
    b557 - block
    b938 - block
    b355 - block
    b731 - block
    b102 - block
    b31 - block
    b370 - block
    b733 - block
    b827 - block
    b509 - block
    b736 - block
    b960 - block
    b103 - block
    b154 - block
    b626 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b912 )
    ( on b278 b912 )
    ( on b543 b278 )
    ( on b191 b543 )
    ( on b871 b191 )
    ( on b658 b871 )
    ( on b375 b658 )
    ( on b112 b375 )
    ( on b496 b112 )
    ( on b22 b496 )
    ( on b401 b22 )
    ( on b557 b401 )
    ( on b938 b557 )
    ( on b355 b938 )
    ( on b731 b355 )
    ( on b102 b731 )
    ( on b31 b102 )
    ( on b370 b31 )
    ( on b733 b370 )
    ( on b827 b733 )
    ( on b509 b827 )
    ( on b736 b509 )
    ( on b960 b736 )
    ( on b103 b960 )
    ( on b154 b103 )
    ( on b626 b154 )
    ( clear b626 )
  )
  ( :goal
    ( and
      ( clear b912 )
    )
  )
)
