( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b636 - block
    b770 - block
    b499 - block
    b148 - block
    b642 - block
    b312 - block
    b187 - block
    b371 - block
    b781 - block
    b242 - block
    b643 - block
    b255 - block
    b61 - block
    b969 - block
    b576 - block
    b822 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b636 )
    ( on b770 b636 )
    ( on b499 b770 )
    ( on b148 b499 )
    ( on b642 b148 )
    ( on b312 b642 )
    ( on b187 b312 )
    ( on b371 b187 )
    ( on b781 b371 )
    ( on b242 b781 )
    ( on b643 b242 )
    ( on b255 b643 )
    ( on b61 b255 )
    ( on b969 b61 )
    ( on b576 b969 )
    ( on b822 b576 )
    ( clear b822 )
  )
  ( :goal
    ( and
      ( clear b636 )
    )
  )
)
