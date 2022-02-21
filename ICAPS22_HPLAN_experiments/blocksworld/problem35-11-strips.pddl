( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b276 - block
    b187 - block
    b623 - block
    b19 - block
    b245 - block
    b270 - block
    b853 - block
    b113 - block
    b564 - block
    b488 - block
    b280 - block
    b47 - block
    b15 - block
    b997 - block
    b917 - block
    b137 - block
    b679 - block
    b961 - block
    b425 - block
    b771 - block
    b237 - block
    b100 - block
    b814 - block
    b9 - block
    b937 - block
    b441 - block
    b221 - block
    b479 - block
    b662 - block
    b387 - block
    b40 - block
    b625 - block
    b538 - block
    b233 - block
    b70 - block
    b588 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b276 )
    ( on b187 b276 )
    ( on b623 b187 )
    ( on b19 b623 )
    ( on b245 b19 )
    ( on b270 b245 )
    ( on b853 b270 )
    ( on b113 b853 )
    ( on b564 b113 )
    ( on b488 b564 )
    ( on b280 b488 )
    ( on b47 b280 )
    ( on b15 b47 )
    ( on b997 b15 )
    ( on b917 b997 )
    ( on b137 b917 )
    ( on b679 b137 )
    ( on b961 b679 )
    ( on b425 b961 )
    ( on b771 b425 )
    ( on b237 b771 )
    ( on b100 b237 )
    ( on b814 b100 )
    ( on b9 b814 )
    ( on b937 b9 )
    ( on b441 b937 )
    ( on b221 b441 )
    ( on b479 b221 )
    ( on b662 b479 )
    ( on b387 b662 )
    ( on b40 b387 )
    ( on b625 b40 )
    ( on b538 b625 )
    ( on b233 b538 )
    ( on b70 b233 )
    ( on b588 b70 )
    ( clear b588 )
  )
  ( :goal
    ( and
      ( clear b276 )
    )
  )
)
