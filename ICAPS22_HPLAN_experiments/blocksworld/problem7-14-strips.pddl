( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b820 - block
    b880 - block
    b669 - block
    b647 - block
    b156 - block
    b470 - block
    b761 - block
    b588 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b880 b820 )
    ( on b669 b880 )
    ( on b647 b669 )
    ( on b156 b647 )
    ( on b470 b156 )
    ( on b761 b470 )
    ( on b588 b761 )
    ( clear b588 )
  )
  ( :goal
    ( and
      ( clear b820 )
    )
  )
)
