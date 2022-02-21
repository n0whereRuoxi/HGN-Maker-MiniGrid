( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b655 - block
    b776 - block
    b722 - block
    b867 - block
    b812 - block
    b207 - block
    b649 - block
    b301 - block
    b124 - block
    b112 - block
    b28 - block
    b1 - block
    b349 - block
    b920 - block
    b56 - block
    b804 - block
    b169 - block
    b732 - block
    b984 - block
    b957 - block
    b948 - block
    b166 - block
    b387 - block
    b331 - block
    b352 - block
    b374 - block
    b771 - block
    b272 - block
    b263 - block
    b201 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b655 )
    ( on b776 b655 )
    ( on b722 b776 )
    ( on b867 b722 )
    ( on b812 b867 )
    ( on b207 b812 )
    ( on b649 b207 )
    ( on b301 b649 )
    ( on b124 b301 )
    ( on b112 b124 )
    ( on b28 b112 )
    ( on b1 b28 )
    ( on b349 b1 )
    ( on b920 b349 )
    ( on b56 b920 )
    ( on b804 b56 )
    ( on b169 b804 )
    ( on b732 b169 )
    ( on b984 b732 )
    ( on b957 b984 )
    ( on b948 b957 )
    ( on b166 b948 )
    ( on b387 b166 )
    ( on b331 b387 )
    ( on b352 b331 )
    ( on b374 b352 )
    ( on b771 b374 )
    ( on b272 b771 )
    ( on b263 b272 )
    ( on b201 b263 )
    ( clear b201 )
  )
  ( :goal
    ( and
      ( clear b655 )
    )
  )
)
