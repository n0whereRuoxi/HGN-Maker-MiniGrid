( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b81 - block
    b496 - block
    b993 - block
    b401 - block
    b848 - block
    b802 - block
    b221 - block
    b785 - block
    b945 - block
    b483 - block
    b549 - block
    b509 - block
    b470 - block
    b66 - block
    b108 - block
    b826 - block
    b661 - block
    b579 - block
    b131 - block
    b822 - block
    b458 - block
    b233 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b81 )
    ( on b496 b81 )
    ( on b993 b496 )
    ( on b401 b993 )
    ( on b848 b401 )
    ( on b802 b848 )
    ( on b221 b802 )
    ( on b785 b221 )
    ( on b945 b785 )
    ( on b483 b945 )
    ( on b549 b483 )
    ( on b509 b549 )
    ( on b470 b509 )
    ( on b66 b470 )
    ( on b108 b66 )
    ( on b826 b108 )
    ( on b661 b826 )
    ( on b579 b661 )
    ( on b131 b579 )
    ( on b822 b131 )
    ( on b458 b822 )
    ( on b233 b458 )
    ( clear b233 )
  )
  ( :goal
    ( and
      ( clear b81 )
    )
  )
)
