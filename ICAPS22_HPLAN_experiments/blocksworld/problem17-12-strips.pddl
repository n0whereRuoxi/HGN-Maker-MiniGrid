( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b918 - block
    b580 - block
    b781 - block
    b715 - block
    b802 - block
    b986 - block
    b141 - block
    b741 - block
    b355 - block
    b535 - block
    b494 - block
    b515 - block
    b684 - block
    b9 - block
    b925 - block
    b711 - block
    b7 - block
    b956 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b918 )
    ( on b580 b918 )
    ( on b781 b580 )
    ( on b715 b781 )
    ( on b802 b715 )
    ( on b986 b802 )
    ( on b141 b986 )
    ( on b741 b141 )
    ( on b355 b741 )
    ( on b535 b355 )
    ( on b494 b535 )
    ( on b515 b494 )
    ( on b684 b515 )
    ( on b9 b684 )
    ( on b925 b9 )
    ( on b711 b925 )
    ( on b7 b711 )
    ( on b956 b7 )
    ( clear b956 )
  )
  ( :goal
    ( and
      ( clear b918 )
    )
  )
)
