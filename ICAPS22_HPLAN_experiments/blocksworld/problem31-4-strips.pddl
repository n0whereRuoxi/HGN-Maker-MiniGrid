( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b16 - block
    b539 - block
    b647 - block
    b350 - block
    b105 - block
    b1 - block
    b391 - block
    b913 - block
    b429 - block
    b890 - block
    b816 - block
    b778 - block
    b979 - block
    b136 - block
    b200 - block
    b492 - block
    b245 - block
    b59 - block
    b456 - block
    b957 - block
    b377 - block
    b804 - block
    b485 - block
    b123 - block
    b370 - block
    b473 - block
    b176 - block
    b309 - block
    b244 - block
    b62 - block
    b383 - block
    b145 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b16 )
    ( on b539 b16 )
    ( on b647 b539 )
    ( on b350 b647 )
    ( on b105 b350 )
    ( on b1 b105 )
    ( on b391 b1 )
    ( on b913 b391 )
    ( on b429 b913 )
    ( on b890 b429 )
    ( on b816 b890 )
    ( on b778 b816 )
    ( on b979 b778 )
    ( on b136 b979 )
    ( on b200 b136 )
    ( on b492 b200 )
    ( on b245 b492 )
    ( on b59 b245 )
    ( on b456 b59 )
    ( on b957 b456 )
    ( on b377 b957 )
    ( on b804 b377 )
    ( on b485 b804 )
    ( on b123 b485 )
    ( on b370 b123 )
    ( on b473 b370 )
    ( on b176 b473 )
    ( on b309 b176 )
    ( on b244 b309 )
    ( on b62 b244 )
    ( on b383 b62 )
    ( on b145 b383 )
    ( clear b145 )
  )
  ( :goal
    ( and
      ( clear b16 )
    )
  )
)
