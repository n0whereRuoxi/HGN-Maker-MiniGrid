( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b987 - block
    b798 - block
    b914 - block
    b612 - block
    b589 - block
    b472 - block
    b925 - block
    b357 - block
    b993 - block
    b822 - block
    b715 - block
    b956 - block
    b840 - block
    b44 - block
    b699 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b987 )
    ( on b798 b987 )
    ( on b914 b798 )
    ( on b612 b914 )
    ( on b589 b612 )
    ( on b472 b589 )
    ( on b925 b472 )
    ( on b357 b925 )
    ( on b993 b357 )
    ( on b822 b993 )
    ( on b715 b822 )
    ( on b956 b715 )
    ( on b840 b956 )
    ( on b44 b840 )
    ( on b699 b44 )
    ( clear b699 )
  )
  ( :goal
    ( and
      ( clear b987 )
    )
  )
)
