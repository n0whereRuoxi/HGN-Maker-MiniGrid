( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b158 - block
    b308 - block
    b631 - block
    b400 - block
    b64 - block
    b319 - block
    b234 - block
    b595 - block
    b971 - block
    b554 - block
    b574 - block
    b453 - block
    b283 - block
    b795 - block
    b859 - block
    b250 - block
    b70 - block
    b796 - block
    b375 - block
    b354 - block
    b657 - block
    b108 - block
    b804 - block
    b315 - block
    b851 - block
    b330 - block
    b965 - block
    b386 - block
    b515 - block
    b212 - block
    b531 - block
    b881 - block
    b294 - block
    b321 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b158 )
    ( on b308 b158 )
    ( on b631 b308 )
    ( on b400 b631 )
    ( on b64 b400 )
    ( on b319 b64 )
    ( on b234 b319 )
    ( on b595 b234 )
    ( on b971 b595 )
    ( on b554 b971 )
    ( on b574 b554 )
    ( on b453 b574 )
    ( on b283 b453 )
    ( on b795 b283 )
    ( on b859 b795 )
    ( on b250 b859 )
    ( on b70 b250 )
    ( on b796 b70 )
    ( on b375 b796 )
    ( on b354 b375 )
    ( on b657 b354 )
    ( on b108 b657 )
    ( on b804 b108 )
    ( on b315 b804 )
    ( on b851 b315 )
    ( on b330 b851 )
    ( on b965 b330 )
    ( on b386 b965 )
    ( on b515 b386 )
    ( on b212 b515 )
    ( on b531 b212 )
    ( on b881 b531 )
    ( on b294 b881 )
    ( on b321 b294 )
    ( clear b321 )
  )
  ( :goal
    ( and
      ( clear b158 )
    )
  )
)
