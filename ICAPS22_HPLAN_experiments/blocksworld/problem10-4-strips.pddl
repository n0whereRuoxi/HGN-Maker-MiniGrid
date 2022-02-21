( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b468 - block
    b647 - block
    b377 - block
    b6 - block
    b849 - block
    b268 - block
    b876 - block
    b461 - block
    b51 - block
    b712 - block
    b714 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b468 )
    ( on b647 b468 )
    ( on b377 b647 )
    ( on b6 b377 )
    ( on b849 b6 )
    ( on b268 b849 )
    ( on b876 b268 )
    ( on b461 b876 )
    ( on b51 b461 )
    ( on b712 b51 )
    ( on b714 b712 )
    ( clear b714 )
  )
  ( :goal
    ( and
      ( clear b468 )
    )
  )
)
