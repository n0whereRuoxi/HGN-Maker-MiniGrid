( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b489 - block
    b79 - block
    b197 - block
    b674 - block
    b683 - block
    b845 - block
    b779 - block
    b991 - block
    b94 - block
    b888 - block
    b958 - block
    b626 - block
    b771 - block
    b20 - block
    b18 - block
    b565 - block
    b141 - block
    b860 - block
    b713 - block
    b232 - block
    b279 - block
    b391 - block
    b912 - block
    b509 - block
    b848 - block
    b776 - block
    b372 - block
    b118 - block
    b73 - block
    b25 - block
    b272 - block
    b57 - block
    b946 - block
    b16 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b489 b442 )
    ( on b79 b489 )
    ( on b197 b79 )
    ( on b674 b197 )
    ( on b683 b674 )
    ( on b845 b683 )
    ( on b779 b845 )
    ( on b991 b779 )
    ( on b94 b991 )
    ( on b888 b94 )
    ( on b958 b888 )
    ( on b626 b958 )
    ( on b771 b626 )
    ( on b20 b771 )
    ( on b18 b20 )
    ( on b565 b18 )
    ( on b141 b565 )
    ( on b860 b141 )
    ( on b713 b860 )
    ( on b232 b713 )
    ( on b279 b232 )
    ( on b391 b279 )
    ( on b912 b391 )
    ( on b509 b912 )
    ( on b848 b509 )
    ( on b776 b848 )
    ( on b372 b776 )
    ( on b118 b372 )
    ( on b73 b118 )
    ( on b25 b73 )
    ( on b272 b25 )
    ( on b57 b272 )
    ( on b946 b57 )
    ( on b16 b946 )
    ( clear b16 )
  )
  ( :goal
    ( and
      ( clear b442 )
    )
  )
)
