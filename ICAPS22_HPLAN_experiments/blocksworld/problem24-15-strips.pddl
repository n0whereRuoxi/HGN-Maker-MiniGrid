( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b859 - block
    b984 - block
    b49 - block
    b966 - block
    b218 - block
    b924 - block
    b346 - block
    b917 - block
    b429 - block
    b972 - block
    b524 - block
    b199 - block
    b328 - block
    b258 - block
    b869 - block
    b282 - block
    b709 - block
    b722 - block
    b100 - block
    b808 - block
    b771 - block
    b453 - block
    b591 - block
    b804 - block
    b62 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b859 )
    ( on b984 b859 )
    ( on b49 b984 )
    ( on b966 b49 )
    ( on b218 b966 )
    ( on b924 b218 )
    ( on b346 b924 )
    ( on b917 b346 )
    ( on b429 b917 )
    ( on b972 b429 )
    ( on b524 b972 )
    ( on b199 b524 )
    ( on b328 b199 )
    ( on b258 b328 )
    ( on b869 b258 )
    ( on b282 b869 )
    ( on b709 b282 )
    ( on b722 b709 )
    ( on b100 b722 )
    ( on b808 b100 )
    ( on b771 b808 )
    ( on b453 b771 )
    ( on b591 b453 )
    ( on b804 b591 )
    ( on b62 b804 )
    ( clear b62 )
  )
  ( :goal
    ( and
      ( clear b859 )
    )
  )
)
