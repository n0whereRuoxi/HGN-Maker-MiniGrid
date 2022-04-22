( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b326 - block
    b214 - block
    b446 - block
    b640 - block
    b378 - block
    b751 - block
    b939 - block
    b242 - block
    b901 - block
    b406 - block
    b861 - block
    b924 - block
    b405 - block
    b674 - block
    b593 - block
    b429 - block
    b322 - block
    b831 - block
    b346 - block
    b145 - block
    b981 - block
    b435 - block
    b236 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b326 )
    ( on b214 b326 )
    ( on b446 b214 )
    ( on b640 b446 )
    ( on b378 b640 )
    ( on b751 b378 )
    ( on b939 b751 )
    ( on b242 b939 )
    ( on b901 b242 )
    ( on b406 b901 )
    ( on b861 b406 )
    ( on b924 b861 )
    ( on b405 b924 )
    ( on b674 b405 )
    ( on b593 b674 )
    ( on b429 b593 )
    ( on b322 b429 )
    ( on b831 b322 )
    ( on b346 b831 )
    ( on b145 b346 )
    ( on b981 b145 )
    ( on b435 b981 )
    ( on b236 b435 )
    ( clear b236 )
  )
  ( :goal
    ( and
      ( clear b326 )
    )
  )
)
